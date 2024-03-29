package myClasses;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Message {

    private String sender;
    private String receiver;
    private String msg;
    private Timestamp msgTime;

    public Message() {
    }

    // Parameterized constructor
    public Message(String sender, String receiver, String msg, Timestamp msgTime) {
        this.sender = sender;
        this.receiver = receiver;
        this.msg = msg;
        this.msgTime = msgTime;
    }

    public String getSender() {
        return this.sender;
    }

    public String getReceiver() {
        return this.receiver;
    }

    public String getMsg() {
        return this.msg;
    }

    public Timestamp getMsgTime() {
        return this.msgTime;
    }

    public String getFormattedMsgTime() {
        if (msgTime != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm | dd/MM/yyyy");
            return dateFormat.format(new Date(msgTime.getTime()));
        } else {
            return null;
        }
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setMsgTime(Timestamp msgTime) {
        this.msgTime = msgTime;
    }
}
