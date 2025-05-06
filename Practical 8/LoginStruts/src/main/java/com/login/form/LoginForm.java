package com.login.form;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import jakarta.servlet.http.HttpServletRequest;

public class LoginForm extends ActionForm {
    private String name;
    private String mobile;
    private String email;

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    @Override
    public ActionErrors validate(
        org.apache.struts.action.ActionMapping mapping,
        HttpServletRequest request) {

        ActionErrors errors = new ActionErrors();

        if (name == null || name.trim().isEmpty()) {
            errors.add("name", new ActionMessage("error.name.required"));
        } else if (!name.matches("[A-Za-z ]+")) {
            errors.add("name", new ActionMessage("error.name.invalid"));
        }

        if (mobile == null || mobile.trim().isEmpty()) {
            errors.add("mobile", new ActionMessage("error.mobile.required"));
        } else if (!mobile.matches("\\d{10}")) {
            errors.add("mobile", new ActionMessage("error.mobile.invalid"));
        }

        if (email == null || email.trim().isEmpty()) {
            errors.add("email", new ActionMessage("error.email.required"));
        } else if (!email.matches("^[\\w.-]+@[\\w.-]+\\.\\w{2,}$")) {
            errors.add("email", new ActionMessage("error.email.invalid"));
        }

        return errors;
    }
}
