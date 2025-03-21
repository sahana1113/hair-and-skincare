package com.pojo;

import java.util.List;

public class Routine {
	private int routine_id;
	private int user_id;
	private String routine_type;
	private String details;
	private String occurence;
	private long start_date;
	private long end_date;
	private boolean is_current;
	
	
	public int getRoutine_id() {
		return routine_id;
	}
	public void setRoutine_id(int routine_id) {
		this.routine_id = routine_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getRoutine_type() {
		return routine_type;
	}
	public void setRoutine_type(String routine_type) {
		this.routine_type = routine_type;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getOccurence() {
		return occurence;
	}
	public void setOccurence(String occurence) {
		this.occurence = occurence;
	}
	public long getStart_date() {
		return start_date;
	}
	public void setStart_date(long start_date) {
		this.start_date = start_date;
	}
	public long getEnd_date() {
		return end_date;
	}
	public void setEnd_date(long end_date) {
		this.end_date = end_date;
	}
	public boolean isIs_current() {
		return is_current;
	}
	public void setIs_current(boolean is_current) {
		this.is_current = is_current;
	}
	
	public static Routine findByOccurrence(List<Routine> objects, String occurrence) {
        return objects.stream()
                      .filter(obj -> occurrence.equals(obj.occurence))
                      .findFirst()
                      .orElse(null);  
    }

}
