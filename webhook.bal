import ballerinax/trigger.asgardeo;
import ballerina/http;
import ballerina/log;

configurable asgardeo:ListenerConfig config = ?;

listener http:Listener httpListener = new(8090);
listener asgardeo:Listener webhookListener =  new(config,httpListener);

service asgardeo:UserOperationService on webhookListener {
  
    remote function onLockUser(asgardeo:GenericEvent event) returns error? {
      log:printInfo("User locked: " + event.toString());
    }
    remote function onUnlockUser(asgardeo:GenericEvent event) returns error? {
      log:printInfo("User Unlocked: " + event.toString());
    }
    remote function onUpdateUserCredentials(asgardeo:GenericEvent event) returns error? {
      log:printInfo("User Update Credientials: " + event.toString());
    }
    remote function onDeleteUser(asgardeo:GenericEvent event) returns error? {
      log:printInfo("User Delete: " + event.toString());
    }
    remote function onUpdateUserGroup(asgardeo:UserGroupUpdateEvent event) returns error? {
      log:printInfo("User Update Group: " + event.toString());
    }
}

service /ignore on httpListener {}
