# frozen_string_literal: true

class ApplicationController < ActionController::Base
    def current_employee
        if session[:employee_id]
            @current_employee ||= Employee.find(session[:employee_id])
        end
    end 
end