# Sonic feature quality Definition


### Feature quality definition

#### Alpha level quality

	*	Code PRs must come with unit tests (VS tests if applicable) aligned to code coverage  <br>
	*	For standalone feature it should be considered to have a compilation flag in disabled mode. Feature requires enabled/disabled via config_db and set to disable. <br>
	*	Can go to master branch only  <br> 
	*	For features based on ASIC vendor SAI implementation: SAI is not available yet <br> 
	*	For feature based on Platform vendor API implementation: not available yet <br> 
	*	Should not cause any degradation on production features running sonic-mgmt. tests suite to ensure that <br> 
	
#### Beta level quality

	*	Code PRs must come with unit tests aligned to code coverage   <br>
	*	For standalone feature it should be considered to have a compilation flag in enabled mode. Feature requires enabled/disabled via config_db and set to disable.   <br>
	*	Can go to master branch only  <br>
	*	For features based on ASIC vendor SAI implementation: SAI is available for at least 1 vendor  <br>
	*	For feature based on Platform vendor API implementation: available for at least 1 vendor   <br>
	*	Should not cause any degradation on production features use relevant sonic-mgmt. tests to confirm  <br>
	*	New sonic-mgmt. test plan has been reviewed but partially implemented  <br>

#### GA level quality 

	*	Code PRs must come unit tests aligned to code coverage   <br>
	*	For standalone feature it should be considered to have a compilation flag in disabled mode. Feature requires enabled/disabled via config_db and set to enabled if HLD claims for it   <br>
	*	Can go to master branch and can be considered as backport feature if must  <br>
	*	For features based on ASIC vendor SAI implementation: SAI is available for at least 1 vendor  <br>
	*	For feature based on Platform vendor API implementation: available for at least 1 vendor   <br>
	*	Should not cause any degradation on production features use relevant sonic-mgmt. tests to confirm  <br>
	*	New sonic-mgmt. test plan has been signed off and fully implemented  <br>
	

### Feature quality in Release Notes

Extend the SONiC Release Notes which covers already the new features added to a release with the quality release. [SONiC_202205_Release_Notes](https://github.com/sonic-net/SONiC/blob/master/doc/SONiC_202205_Release_Notes.md#feature-list)

 - Make the feature list as a table

 | Feature Name | Feature Description | HLD PR / PR tracking | Maturity |
 |----------|----------|----------|----------|

	*	If Beta/GA level maturity, ensure to provide a sonic-mgmt. PR or code as reference. 
	*	If sonic-mgmt. tests comes after the Release note is released, it can still be modified
	*	Maturity to be approved by sonic test subgroup based on the availability of the test and the coverage it expects to gain
	*	Note: quality can be provided only on tests results availability, and this is out of the scope of this discussion 

 - What we gain?

	*	One way to declare features quality
	*	Contribution awareness for quality guarantee and aim for GA level
	*	Clear and simple way for SONiC end users (who are not in the details of the code itself)
	

### Action items s and notes

	*	HLD template should be extended with memory consumption section
			Notes to be taken:
			*	No memory consumption expected when the feature is disabled via compilation 
			*	No growing memory consumption while feature is disabled by configuration
	*	Feature should be delivered with the following ON/OFF flags
			*	Feature can be runtime disabled/enabled via configuration. 
			*	Disabled while work in progress and majority is not GA.
			*	Can be enabled by default (if agreed on HLD review) only in GA level only
	*	202305 Release note should be aligned with the new suggestion. It will be used for sharing information on features and availability of the tests.
	*	Once TSC approves suggestion, take to SONiC community and inform contributors to align on 202311 feature contribution
	*	sonic-mgmt. group to decide on quality guarantee template. Ying Xie (Microsoft) and Roy Sror (Nvidia) to lead

























 