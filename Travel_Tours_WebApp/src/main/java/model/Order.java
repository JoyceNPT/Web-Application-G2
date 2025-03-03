package model;

import java.sql.Date;

/**
 * This class is used to store data/attributes corresponding to tables in the
 * database.
 *
 * @author ThinhNPCE170008
 */
public class Order {

    // Attributes of the Order class
    private int _id;
    private int _userId;
    private double _total;
    private Date _date;
    private int _status;

    /**
     * Default constructor initializes an empty order.
     */
    public Order() {
        this._id = -1;
        this._userId = -1;
        this._total = 0.0;
        this._date = _date;
        this._status = -1;
    }

    /**
     * Parameterized constructor to create an order with specified details.
     *
     * @param _id Unique identifier for the order.
     * @param _userId ID of the user who placed the order.
     * @param _total Total amount of the order.
     * @param _date Date when the order was placed.
     * @param _status Status of the order (e.g., pending, completed, canceled).
     */
    public Order(int _id, int _userId, double _total, Date _date, int _status) {
        this._id = _id;
        this._userId = _userId;
        this._total = _total;
        this._date = _date;
        this._status = _status;
    }

    /**
     * Gets the order ID.
     *
     * @return The unique identifier of the order.
     */
    public int getId() {
        return _id;
    }

    /**
     * Sets the order ID.
     *
     * @param _id The unique identifier to be assigned to the order.
     */
    public void setId(int _id) {
        this._id = _id;
    }

    /**
     * Gets the user ID associated with the order.
     *
     * @return The ID of the user who placed the order.
     */
    public int getUserId() {
        return _userId;
    }

    /**
     * Sets the user ID associated with the order.
     *
     * @param _userId The ID of the user who placed the order.
     */
    public void setUserId(int _userId) {
        this._userId = _userId;
    }

    /**
     * Gets the total amount of the order.
     *
     * @return The total price of the order.
     */
    public double getTotal() {
        return _total;
    }

    /**
     * Sets the total amount of the order.
     *
     * @param _total The total price to be assigned to the order.
     */
    public void setTotal(double _total) {
        this._total = _total;
    }

    /**
     * Gets the date when the order was placed.
     *
     * @return The date of the order.
     */
    public Date getDate() {
        return _date;
    }

    /**
     * Sets the date when the order was placed.
     *
     * @param _date The date to be assigned to the order.
     */
    public void setDate(Date _date) {
        this._date = _date;
    }

    /**
     * Gets the status of the order.
     *
     * @return The status of the order (e.g., pending, completed, canceled).
     */
    public int getStatus() {
        return _status;
    }

    /**
     * Sets the status of the order.
     *
     * @param _status The status to be assigned to the order.
     */
    public void setStatus(int _status) {
        this._status = _status;
    }

    /**
     * Returns a string representation of the Order object.
     *
     * @return A string containing all order attributes.
     */
    @Override
    public String toString() {
        return "Order{" + "_id=" + _id + ", _userId=" + _userId + ", _total=" + _total + ", _date=" + _date + ", _status=" + _status + '}';
    }

}
