package model;

import java.sql.Date;

/**
 * This class is used to store data/attributes corresponding to tables in the
 * database.
 *
 * @author ThinhNPCE170008
 */
public class User {

    // Attributes of the User class
    private int _id;
    private String _username;
    private String _password;
    private String _fullname;
    private String _email;
    private String _phone;
    private int _role;
    private Date _created;

    /**
     * The default constructor contains the available information.
     */
    public User() {
        this._id = -1;
        this._username = "";
        this._password = "";
        this._fullname = "";
        this._email = "";
        this._phone = "";
        this._role = -1;
        this._created = _created;
    }

    /**
     * The constructor contains information that will be updated when data is
     * sent in.
     *
     * @param _id id is the attribute that contains the account code of the
     * account.
     * @param _username username is the account name attribute used to log in to
     * the application.
     * @param _password password is an attribute used to check for logging into
     * the application.
     * @param _fullname fullname is an attribute used to display the full name
     * of the account owner.
     * @param _email email is an attribute used to declare the user's email to
     * discuss issues when necessary.
     * @param _phone phone is an attribute used to declare the user's phone
     * number to discuss issues when necessary.
     * @param _role role is an attribute used to check the user's role to
     * provide the required functionality.
     * @param _created created is an attribute used to check when the account
     * was created.
     */
    public User(int _id, String _username, String _password, String _fullname, String _email, String _phone, int _role, Date _created) {
        this._id = _id;
        this._username = _username;
        this._password = _password;
        this._fullname = _fullname;
        this._email = _email;
        this._phone = _phone;
        this._role = _role;
        this._created = _created;
    }

    /**
     * Gets the user ID.
     *
     * @return The unique identifier of the user.
     */
    public int getId() {
        return _id;
    }

    /**
     * Sets the user ID.
     *
     * @param _id The unique identifier to be assigned to the user.
     */
    public void setId(int _id) {
        this._id = _id;
    }

    /**
     * Gets the username of the user.
     *
     * @return The username associated with the user.
     */
    public String getUsername() {
        return _username;
    }

    /**
     * Sets the username of the user.
     *
     * @param _username The username to be assigned to the user.
     */
    public void setUsername(String _username) {
        this._username = _username;
    }

    /**
     * Gets the password of the user.
     *
     * @return The password associated with the user.
     */
    public String getPassword() {
        return _password;
    }

    /**
     * Sets the password of the user.
     *
     * @param _password The password to be assigned to the user.
     */
    public void setPassword(String _password) {
        this._password = _password;
    }

    /**
     * Gets the full name of the user.
     *
     * @return The full name of the user.
     */
    public String getFullname() {
        return _fullname;
    }

    /**
     * Sets the full name of the user.
     *
     * @param _fullname The full name to be assigned to the user.
     */
    public void setFullname(String _fullname) {
        this._fullname = _fullname;
    }

    /**
     * Gets the email of the user.
     *
     * @return The email address associated with the user.
     */
    public String getEmail() {
        return _email;
    }

    /**
     * Sets the email of the user.
     *
     * @param _email The email address to be assigned to the user.
     */
    public void setEmail(String _email) {
        this._email = _email;
    }

    /**
     * Gets the phone number of the user.
     *
     * @return The phone number associated with the user.
     */
    public String getPhone() {
        return _phone;
    }

    /**
     * Sets the phone number of the user.
     *
     * @param _phone The phone number to be assigned to the user.
     */
    public void setPhone(String _phone) {
        this._phone = _phone;
    }

    /**
     * Gets the role ID of the user.
     *
     * @return The role ID associated with the user.
     */
    public int getRole() {
        return _role;
    }

    /**
     * Sets the role ID of the user.
     *
     * @param _role The role ID to be assigned to the user.
     */
    public void setRole(int _role) {
        this._role = _role;
    }

    /**
     * Gets the creation date of the user account.
     *
     * @return The date when the user account was created.
     */
    public Date getCreated() {
        return _created;
    }

    /**
     * Sets the creation date of the user account.
     *
     * @param _created The date when the user account was created.
     */
    public void setCreated(Date _created) {
        this._created = _created;
    }

    /**
     * Returns a string representation of the User object.
     *
     * @return A string containing all user attributes.
     */
    @Override
    public String toString() {
        return "User{" + "_id=" + _id + ", _username=" + _username + ", _password=" + _password + ", _fullname=" + _fullname + ", _email=" + _email + ", _phone=" + _phone + ", _role=" + _role + ", _created=" + _created + '}';
    }

}
