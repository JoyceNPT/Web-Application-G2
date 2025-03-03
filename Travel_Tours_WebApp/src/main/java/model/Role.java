package model;

/**
 * This class is used to store data/attributes corresponding to tables in the
 * database.
 *
 * @author ThinhNPCE170008
 */
public class Role {

    // Attributes of the Role class
    private int _id;
    private String _name;

    /**
     * Default constructor initializes the role with default values.
     */
    public Role() {
        this._id = -1;
        this._name = "";
    }

    /**
     * Parameterized constructor to initialize the role with specific values.
     *
     * @param _id The unique identifier for the role.
     * @param _name The name of the role.
     */
    public Role(int _id, String _name) {
        this._id = _id;
        this._name = _name;
    }

    /**
     * Gets the role ID.
     *
     * @return The unique identifier of the role.
     */
    public int getId() {
        return _id;
    }

    /**
     * Sets the role ID.
     *
     * @param _id The unique identifier to be assigned to the role.
     */
    public void setId(int _id) {
        this._id = _id;
    }

    /**
     * Gets the role name.
     *
     * @return The name of the role.
     */
    public String getName() {
        return _name;
    }

    /**
     * Sets the role name.
     *
     * @param _name The name to be assigned to the role.
     */
    public void setName(String _name) {
        this._name = _name;
    }

    /**
     * Returns a string representation of the Role object.
     *
     * @return A string containing all role attributes.
     */
    @Override
    public String toString() {
        return "Role{" + "_id=" + _id + ", _name=" + _name + '}';
    }

}
