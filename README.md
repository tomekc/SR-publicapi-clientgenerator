# SmartRecruiters Public API 

This is Swagger-generated client for SmartRecruiters Public API.

### Running

Running `build-clients.sh` script will create clients in subdirectory `generated`.
Currently Java and Swift client is built.

Prior to running the script you need to install [swagger-codegen](https://github.com/swagger-api/swagger-codegen) on your PATH.



### Java client

 * Build a client
    
		./build-clients.sh
 
 * Install to local maven repository
 
 		cd generated/java
 		mvn install
 		
 * Use in project!

#### Usage

```
CandidatesApi api = new CandidatesApi();
api.getApiClient().addDefaultHeader("X-SmartToken", "YOUR-TOKEN-HERE");
CandidateList people = api.findCandidates(null, 10, 0, null, null, null, null, null, null, null, null);

```