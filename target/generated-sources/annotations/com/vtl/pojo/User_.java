package com.vtl.pojo;

import com.vtl.pojo.Administator;
import com.vtl.pojo.Candidate;
import com.vtl.pojo.Company;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-01T15:23:05")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> password;
    public static volatile SingularAttribute<User, Candidate> candidate;
    public static volatile SingularAttribute<User, Integer> isDeleted;
    public static volatile SetAttribute<User, Administator> administatorSet;
    public static volatile SingularAttribute<User, Company> company;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, String> userRole;
    public static volatile SingularAttribute<User, String> username;
    public static volatile SingularAttribute<User, Date> registerDate;

}