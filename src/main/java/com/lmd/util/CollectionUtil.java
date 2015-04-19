package com.lmd.util;

import java.util.Collection;

import org.springframework.util.CollectionUtils;

public abstract class CollectionUtil extends CollectionUtils {

	public static <T,M> boolean contains(Collection<T> collection, M m, Comparator<T,M> comparator){
		if(CollectionUtils.isEmpty(collection))return false;
		for(T t : collection){
			if(comparator.equals(t, m)) return true;
		}
		return false;
	}
	
	public static <T,M> T find(Collection<T> collection, M m, Comparator<T,M> comparator){
		if(CollectionUtils.isEmpty(collection))return null;
		for(T t : collection){
			if(comparator.equals(t, m)) return t;
		}
		return null;
	}
	
	public static interface Comparator<T,M>{
		public boolean equals(T t, M m);
	}
	
	
}
