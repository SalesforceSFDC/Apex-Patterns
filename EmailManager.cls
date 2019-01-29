public class EmailManager {
    //public method
    public void sendMail(String address, String subject, String body) {
        //Create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};

    }
}