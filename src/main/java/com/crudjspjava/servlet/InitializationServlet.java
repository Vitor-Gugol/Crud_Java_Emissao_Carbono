package com.crudjspjava.servlet;

import java.beans.PropertyEditorManager;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.crudjspjava.editor.DatePropertyEditor;

@WebServlet(name = "InitializationServlet", loadOnStartup = 1, urlPatterns = {})
public class InitializationServlet extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
        // Registra o editor de propriedades para o tipo java.util.Date
        PropertyEditorManager.registerEditor(Date.class, DatePropertyEditor.class);
    }
}
