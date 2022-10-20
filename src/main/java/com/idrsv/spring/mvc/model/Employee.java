package com.idrsv.spring.mvc.model;

import com.idrsv.spring.mvc.validation.CheckEmail;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.*;
import java.util.HashMap;
import java.util.Map;
@Getter
@Setter
@ToString
public class Employee {
    @Size(min = 2, message = "Name must be min 2 symbols!")
    private String name;
    @NotBlank(message = "Surname is required field!")
    private String surname;
    @Min(value = 500, message = "must be greater then 499")
    @Max(value = 1000, message = "must be less then 1001")
    private int salary;
    private String department;
    private Map<String,String> departments;
    private String carBrand;
    private Map<String,String> carBrands;
    private String[] languages;
    private Map<String,String> languagesMap;
    @Pattern(regexp = "\\d{3}-\\d{3}-\\d{2}-\\d{2}", message = "Please use patter +7-XXX-XXX-XX-XX")
    private String phoneNumber;
    @CheckEmail
    private String email;

    public Employee() {
        departments = new HashMap<>();
        departments.put("Information Technology", "IT");
        departments.put("Human Resources", "HR");
        departments.put("Sales", "Sales");

        carBrands = new HashMap<>();
        carBrands.put("BMW", "BMW");
        carBrands.put("Audi", "Audi");
        carBrands.put("VW", "VW");

        languagesMap = new HashMap<>();
        languagesMap.put("English", "EN");
        languagesMap.put("Deutch", "DE");
        languagesMap.put("French", "FR");
    }

}
