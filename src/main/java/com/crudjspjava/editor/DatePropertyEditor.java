package com.crudjspjava.editor;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DatePropertyEditor extends PropertyEditorSupport {

    private final SimpleDateFormat dateFormat;

    public DatePropertyEditor() {
        this.dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    }

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        try {
            Date date = dateFormat.parse(text);
            setValue(date);
        } catch (ParseException e) {
            throw new IllegalArgumentException("Invalid date format", e);
        }
    }
}
