# How to Contribute to SONiC Community                                                   
                          
## High Level Design Document                                   
#### Rev 0.1                                                   

## About this Manual
This document provides general information about the ways of contribution, to the SONiC Community.

## Scope                                                                                  
This document describes the scope of a SONiC Community member, and his/her contribution towards the community progress.

# 1 Overview on Contribution towards SONiC

## 1.0 Legal
We welcome everyone to contribute to SONiC project. A [Contribution License Agreement](https://www.1eswiki.com/wiki/Automating_Contribution_License_Agreements) is required before you making a contribution to the open source project. 

Please find and sign the CLA [here](https://cla.microsoft.com). Thanks for your support.

## 1.1 Joining the SONiC Community
 A member can contribute the community by signing in Github and can access the SONiC contribution. A member can join the various SONiC groups
 and can start attending actively over the weekly discssion on the ongoing activities. Following are the way of contributions and its process for the community
 
 #### 1.2 Technical Contribution
 #### 1.3 Process on Contribution
 #### 1.4 Process on Pull Request
	
## 1.2 Technical Contribution
 A member can involve in following technical contribution to SONiC community
##### 1.2.1 Development
##### 1.2.2 Reviews
##### 1.3.3 Testing 
##### 1.4.4 BugFixing 
##### 1.5.5 Documentation
  
### 1.2.1 Development                    
A member can contribute by owning and develop a feature for SONiC or enhance an existing feature/sub-features. He/She has to inform the community about ownership of his/her feature development/enhancement and ensure that the feature is added to roadmap. He/She should develop the code in a private branch pulled from the master branch(explained in detail in process section). He/She should own the feature for completion upon the agreed schedule and should be in a position to give technical updates on the progress and status of it, inline to agreed schedule. He/She should be in a position to develop the code, review it across the community members during the review meeting and ensure to raise a Pull request(explained in below section) for the code to be merged to master branch after final review and approval from the community.
              
### 1.2.2 Reviews
A member shoud be able to review the owned feature with the community in periodic interval on the progress and its technical update should be presented to the community members during feature review. Any changes in the design/flow should be discussed, reviewed and changed. All the changes including cosmetic changes needs to be reviewed for approval.

### 1.3.3 Testing
A member can also be part of testing the feature. He/She can able to review the existing test cases for the available features which can be enhanced. He/She can come up with new test cases to the existing feature list or to the ongoing features. He/She should review their written test cases with the community members in order to update the same in sonic-mgnt-repository. He/She should develop the test case in a private repository pulled from the master branch(explained in detail in process section) and ensure to raise a Pull request for the test cases to be merged to master branch after final review and approval from the community.                                  

### 1.4.4 BugFixing
A member can be a part of issue triage team, where he/she can join the community to review the ongoing pull request and come up with the issues which can be fixed.

### 1.5.5 Documentation
A member can also contribute to technical documentation. He/She can own up the Config guide, CLI  guide, use-cases documentation, deployment scenarios documentation, for the ongoing feature or the existing feture which needs an enhancement. The documentation would be reviewed with the community members to be published in the SONiC community.

## 1.3 Process on Contribution
This section gives a detailed description on adhering the process for contributing to the community. 

### 1.3.1 Process on Code Development
As mentioned in previous section, a member should inform the community about ownership of his/her feature development/enhancement and ensure that the feature is added to roadmap. He/She has to pull a seperate private branch from the master branch in the corresponding community repository in order to develop their code.The High level design document should always be in markdown file format. Plan the workflow & provide a schedule for release to the community members. The plan should include requirements, design, design review with community, code & test, code review by community & PR merge, final testing, test-cases if applicable, CLI document update, config document update. This plan should be reviewed and approved by community members before the development/enhancement of owned feature. He/She should execute as per the plan and schedule community reviews in advance. He/She should ensure that the feature HLD review is completed and  HLD reveiw comments are addressed and merge the Pull Request(explained in below section). He/She should ensure that code checkin and Pull Request has been raised for the feature. And ensure code is reviewed by the community and merged as per the planned release.

### 1.3.2 Process on Repositories
As mentioned earlier, a seperate private branch has to be pulled from master branch in an appropriate repository. There are various code repository available such as sonic-buildimage, sonic-utilities, sonic-swss, sonic-build-system etc. He/She should ensure that the owned feature is updated in  the right repository to add the development code and its corresponding HLD document.

### 1.3.3 Process on Release Cycle
The community will follow the roadmap for release and would be updated periodically. The release tracking will be followed for all the ongoing feature on the release and its corresponding HLD discussion will be happening every week. A member should ensure that he/she actively involves his/her self in the discussion. The release tracking sheet should be updated periodically to ensure the status of the ongoing release. Release notes will be issued upon successful release for the completed features. 

## 1.4 Process on Pull Request
Find below the steps to raise a Pull Request for the HLD document as well as for the development Code.
-Fork the corresponding repository for the owned feature
-Clone your repository 
-Create a private branch for updating the HLD and code development.
-Do necessary changes upon review comments if any
-Push the HLD document code development 
-And raise a new pull request.
Find the below example on raising a pull request

```
git clone https://github.com/kannankvs/sonic-buildimage.git	 	 
git clone https://github.com/kannankvs/sonic-utilities.git	 	 
git clone https://github.com/vharish02/sonic-utilities.git	 	 
git checkout -b mvrf_ip_rule_priority_change_to_32765	git checkout mvrf_ip_rule_priority_change_to_32765	 
git push origin mvrf_ip_rule_priority_change_to_32765	 	 

```

## Design Spec
1. Create the file as MD (markdown) format;
2. Send as a pull request to https://github.com/Azure/SONiC/pulls;
3. Go through community design review;
4. Once approved, the doc will be merged to https://github.com/Azure/SONiC repo;
5. The doc will be published on SONiC WiKi;

## File A Issue
1. Issues should be filed under https://github.com/Azure/sonic-buildimage/issues;
2. Please fill the template as 
- Description
- Steps to reproduce the issue:
- Describe the results you received:
- Describe the results you expected:
- Attach debug file
3. Submit