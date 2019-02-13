/**
 * An Apex class that creates a portal user
 */
 public class SiteRegisterController {
    // PORTAL_ACCOUNT_ID is the account on which the contact will be created on
    // and then enabled as a portal user.
    // Enter the account ID in place of <portal_account_id> below.
    private static Id PORTAL_ACCOUNT_ID = 'id.....';

    public SiteRegisterController() {

    }

    public String username {get; set;}
    public String email {get; set;}
    public String password {get: set {} }

 }
