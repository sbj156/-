package com.ketayao.ketacustom.util.persistence;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.EnumUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;

import com.ketayao.ketacustom.SecurityConstants;
import com.ketayao.ketacustom.util.persistence.SearchFilter.Operator;
import com.ketayao.utils.Exceptions;
import com.ketayao.utils.ServletUtils;
import com.lmd.ggzy.jpa.criterion.SpecificationFactory;

public class DynamicSpecifications {
	private static final Logger logger = LoggerFactory.getLogger(DynamicSpecifications.class);
	private static FormattingConversionServiceFactoryBean conversionService;

	private static SpecificationFactory specificationFactory;

	@Autowired
	public DynamicSpecifications(FormattingConversionServiceFactoryBean conversionService, SpecificationFactory specificationFactory) {
		super();
		DynamicSpecifications.conversionService = conversionService;
		DynamicSpecifications.specificationFactory = specificationFactory;

		// TODO Auto-generated constructor stub
	}

	// 用于存储每个线程的request请求
	private static final ThreadLocal<HttpServletRequest> LOCAL_REQUEST = new ThreadLocal<HttpServletRequest>();

	private static final String SHORT_DATE = "yyyy-MM-dd";
	private static final String LONG_DATE = "yyyy-MM-dd mm:HH:ss";
	private static final String TIME = "mm:HH:ss";

	public static void putRequest(HttpServletRequest request) {
		LOCAL_REQUEST.set(request);
	}

	public static HttpServletRequest getRequest() {
		return LOCAL_REQUEST.get();
	}

	public static void removeRequest() {
		LOCAL_REQUEST.remove();
	}

	public static Collection<SearchFilter> genSearchFilter(ServletRequest request, String prefix) {
		Map<String, Object> searchParams = ServletUtils.getParametersStartingWith(request, prefix);
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		return filters.values();
	}

	public static Collection<SearchFilter> genSearchFilter(ServletRequest request) {
		Map<String, Object> searchParams = ServletUtils.getParametersStartingWith(request, SecurityConstants.SEARCH_PREFIX);
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		return filters.values();
	}

	public static <T> Specification<T> bySearchFilter(ServletRequest request, final Class<T> entityClazz, final Collection<SearchFilter> searchFilters) {
		return bySearchFilter(request, entityClazz, searchFilters.toArray(new SearchFilter[] {}));
	}

	public static <T> Specification<T> bySearchFilter(ServletRequest request, final Class<T> entityClazz, Specification<T> specifications) {
		return bySearchFilter(request, entityClazz, new Specification[] { specifications });
	}

	public static <T> Specification<T> bySearchFilter(ServletRequest request, final Class<T> entityClazz, Specification<T>[] specifications) {
		Specifications<T> s = Specifications.where(bySearchFilter(request, entityClazz));
		if (specifications != null) {
			for (Specification<T> specification : specifications)
				s = s.and(specification);
		}
		return s;
	}

	public static <T> Specification<T> bySearchFilter(ServletRequest request, final Class<T> entityClazz, final SearchFilter... searchFilters) {
		Collection<SearchFilter> filters = genSearchFilter(request);
		Set<SearchFilter> set = new HashSet<SearchFilter>(filters);
		for (SearchFilter searchFilter : searchFilters) {
			set.add(searchFilter);
		}
		Specifications<T> spec = Specifications.where(bySearchFilter(entityClazz, set));
		spec = spec.and(specificationFactory.getSpecification(request.getParameterValues("taskId")));
		return spec;
	}

	public static Collection<SearchFilter> genSearchFilter(Map<String, Object> request) {
		Map<String, Object> searchParams = ServletUtils.getParametersStartingWith(request, SecurityConstants.SEARCH_PREFIX);
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		return filters.values();
	}

	public static <T> Specification<T> bySearchFilter(Map<String, Object> map, final Class<T> entityClazz, final SearchFilter... searchFilters) {
		Collection<SearchFilter> filters = genSearchFilter(map);
		Set<SearchFilter> set = new HashSet<SearchFilter>(filters);
		for (SearchFilter searchFilter : searchFilters) {
			set.add(searchFilter);
		}
		Specifications<T> spec = Specifications.where(bySearchFilter(entityClazz, set));
		spec = spec.and(specificationFactory.getSpecification((String[]) map.get("taskId")));
		return spec;
	}

	public static <T> Specification<T> buildspecification(final Class<T> clazz, final String[] properties, final Operator[] operators, final Object[] values) {

		if (properties == null || operators == null || values == null || !(properties.length == operators.length && values.length == operators.length))
			return null;
		Set<SearchFilter> filters = new HashSet<SearchFilter>();
		for (int i = 0; i < properties.length; i++) {
			filters.add(new SearchFilter(properties[i], operators[i], values[i]));
		}
		return bySearchFilter(clazz, filters);
	}

	public static synchronized <T> Specification<T> buildSpecification(final Collection<SearchFilter> filters) {
		return new Specification<T>() {
			@SuppressWarnings({ "rawtypes" })
			@Override
			public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				if (filters != null && !filters.isEmpty()) {
					List<Predicate> predicates = new ArrayList<Predicate>();
					for (SearchFilter filter : filters) {
						// nested path translate, 如Task的名为"user.name"的filedName,
						// 转换为Task.user.name属性
						String[] names = StringUtils.split(filter.getFieldName(), ".");
						Path<?> expression = null;
						try {
							expression = root.get(names[0]);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							logger.error(e.getMessage());
							continue;
						}
						for (int i = 1; i < names.length; i++) {
							expression = expression.get(names[i]);
						}

						logger.info("CriteriaBuilder " + filter.getFieldName() + "\t" + filter.getOperator() + "\t" + filter.getValue());
						/**
						 * SEARCH_ISNULL_属性,param的值需转换为boolean类型
						 */
						if (filter.getOperator() == Operator.ISNULL) {
							Boolean b = conversionService.getObject().convert(filter.getValue(), Boolean.class);
							if (b)
								predicates.add(builder.isNull(expression));
							else
								predicates.add(builder.isNotNull(expression));
							continue;
						} else if (filter.getOperator() == Operator.EMPTY) {
							Boolean b = conversionService.getObject().convert(filter.getValue(), Boolean.class);
							if (b)
								predicates.add(builder.isEmpty(convert(Collection.class, expression)));
							else
								predicates.add(builder.isNotEmpty(convert(Collection.class, expression)));
							continue;
						}
						// 自动进行enum和date的转换。
						Class clazz = expression.getJavaType();
						filter.setValue(conversionService.getObject().convert(filter.getValue(), clazz));
						/*
						 * if ((Date.class.isAssignableFrom(clazz) && !filter
						 * .getValue().getClass().equals(clazz))) {
						 * filter.setValue(convert2Date((String) filter
						 * .getValue())); } else if
						 * (Enum.class.isAssignableFrom(clazz) &&
						 * !filter.getValue().getClass().equals(clazz)) {
						 * filter.setValue(convert2Enum(clazz, (String)
						 * filter.getValue())); } else if
						 * (Calendar.class.isAssignableFrom(clazz) &&
						 * filter.getValue().getClass() .equals(String.class)) {
						 * filter.setValue(convert2Calendar((String) filter
						 * .getValue())); }
						 */
						// logic operator
						switch (filter.getOperator()) {
						case EQ:
							predicates.add(builder.equal(expression, filter.getValue()));
							break;
						case LIKE:
							predicates.add(builder.like(convert(clazz, expression), "%" + filter.getValue() + "%"));
							break;
						case GT:
							predicates.add(builder.greaterThan(convert(clazz, expression), (Comparable) filter.getValue()));
							break;
						case LT:
							predicates.add(builder.lessThan(convert(clazz, expression), (Comparable) filter.getValue()));
							break;
						case GTE:
							predicates.add(builder.greaterThanOrEqualTo(convert(clazz, expression), (Comparable) filter.getValue()));
							break;
						case LTE:
							predicates.add(builder.lessThanOrEqualTo(convert(clazz, expression), (Comparable) filter.getValue()));
							break;
						case IN:
							predicates.add(builder.and(expression.in((Object[]) filter.getValue())));
							break;
						}
					}

					// 将所有条件用 and 联合起来
					if (predicates.size() > 0) {
						return builder.and(predicates.toArray(new Predicate[predicates.size()]));
					}
				}

				return builder.conjunction();
			}
		};
	}

	@SuppressWarnings("unchecked")
	public static <T> Specification<T> bySearchFilter(final Class<T> entityClazz, final Collection<SearchFilter> searchFilters) {
		Set<SearchFilter> filterSet = new HashSet<SearchFilter>();
		filterSet.addAll(searchFilters);
		ServletRequest request = getRequest();
		if (request != null) {
			// 数据权限中的filter
			Collection<SearchFilter> nestFilters = (Collection<SearchFilter>) request.getAttribute(SecurityConstants.NEST_DYNAMIC_SEARCH);
			if (nestFilters != null && !nestFilters.isEmpty()) {
				for (SearchFilter searchFilter : nestFilters) {
					filterSet.add(searchFilter);
				}
			}
		}
		return buildSpecification(filterSet);
	}

	private static Date convert2Date(String dateString) {
		SimpleDateFormat sFormat = new SimpleDateFormat(SHORT_DATE);
		try {
			return sFormat.parse(dateString);
		} catch (ParseException e) {
			try {
				return sFormat.parse(LONG_DATE);
			} catch (ParseException e1) {
				try {
					return sFormat.parse(TIME);
				} catch (ParseException e2) {
					logger.error("Convert time is error! The dateString is " + dateString + "." + Exceptions.getStackTraceAsString(e2));
				}
			}
		}

		return null;
	}

	private static Calendar convert2Calendar(String dateString) {
		Date d = convert2Date(dateString);
		if (d == null)
			return null;
		Calendar c = Calendar.getInstance();
		c.setTime(d);
		return c;

	}

	private static <E extends Enum<E>> E convert2Enum(Class<E> enumClass, String enumString) {
		return EnumUtils.getEnum(enumClass, enumString);
	}

	private static <T> Expression<T> convert(Class<T> clazz, Expression expression) {
		return (Expression<T>) expression;
	}
}
