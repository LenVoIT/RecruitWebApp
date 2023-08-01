package com.vtl.pojo;

import com.vtl.pojo.Candidate;
import com.vtl.pojo.Company;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-01T15:23:05")
@StaticMetamodel(CandidateCompany.class)
public class CandidateCompany_ { 

    public static volatile SingularAttribute<CandidateCompany, Company> companyID;
    public static volatile SingularAttribute<CandidateCompany, Integer> id;
    public static volatile SingularAttribute<CandidateCompany, Candidate> candidateID;

}