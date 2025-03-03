package model;

import java.sql.Date;

/**
 * This class is used to store data/attributes corresponding to tables in the
 * database.
 *
 * @author ThinhNPCE170008
 */
public class Booking {

    // Attributes of the Booking class
    private int _id;
    private Date _date;
    private int _numPeople;
    private double _total;
    private int _status;
    private int _userId;
    private int _tourId;

    /**
     * Default constructor initializes an empty booking.
     */
    public Booking() {
        this._id = -1;
        this._date = _date;
        this._numPeople = -1;
        this._total = 0.0;
        this._status = -1;
        this._userId = -1;
        this._tourId = -1;
    }

    /**
     * Parameterized constructor to initialize a booking with specific values.
     *
     * @param _id Unique identifier for the booking.
     * @param _date Date when the booking was made.
     * @param _numPeople Number of people included in the booking.
     * @param _total Total cost of the booking.
     * @param _status Status of the booking.
     * @param _userId ID of the user who made the booking.
     * @param _tourId ID of the tour associated with the booking.
     */
    public Booking(int _id, Date _date, int _numPeople, double _total, int _status, int _userId, int _tourId) {
        this._id = _id;
        this._date = _date;
        this._numPeople = _numPeople;
        this._total = _total;
        this._status = _status;
        this._userId = _userId;
        this._tourId = _tourId;
    }

    /**
     * Gets the booking ID.
     *
     * @return The unique identifier of the booking.
     */
    public int getId() {
        return _id;
    }

    /**
     * Sets the booking ID.
     *
     * @param _id The unique identifier to be assigned to the booking.
     */
    public void setId(int _id) {
        this._id = _id;
    }

    /**
     * Gets the date of the booking.
     *
     * @return The date when the booking was made.
     */
    public Date getDate() {
        return _date;
    }

    /**
     * Sets the date of the booking.
     *
     * @param _date The date to be assigned to the booking.
     */
    public void setDate(Date _date) {
        this._date = _date;
    }

    /**
     * Gets the number of people in the booking.
     *
     * @return The number of people included in the booking.
     */
    public int getNumPeople() {
        return _numPeople;
    }

    /**
     * Sets the number of people in the booking.
     *
     * @param _numPeople The number of people to be assigned to the booking.
     */
    public void setNumPeople(int _numPeople) {
        this._numPeople = _numPeople;
    }

    /**
     * Gets the total cost of the booking.
     *
     * @return The total cost of the booking.
     */
    public double getTotal() {
        return _total;
    }

    /**
     * Sets the total cost of the booking.
     *
     * @param _total The total cost to be assigned to the booking.
     */
    public void setTotal(double _total) {
        this._total = _total;
    }

    /**
     * Gets the status of the booking.
     *
     * @return The current status of the booking.
     */
    public int getStatus() {
        return _status;
    }

    /**
     * Sets the status of the booking.
     *
     * @param _status The status to be assigned to the booking.
     */
    public void setStatus(int _status) {
        this._status = _status;
    }

    /**
     * Gets the user ID associated with the booking.
     *
     * @return The ID of the user who made the booking.
     */
    public int getUserId() {
        return _userId;
    }

    /**
     * Sets the user ID associated with the booking.
     *
     * @param _userId The user ID to be assigned to the booking.
     */
    public void setUserId(int _userId) {
        this._userId = _userId;
    }

    /**
     * Gets the tour ID associated with the booking.
     *
     * @return The ID of the tour associated with the booking.
     */
    public int getTourId() {
        return _tourId;
    }

    /**
     * Sets the tour ID associated with the booking.
     *
     * @param _tourId The tour ID to be assigned to the booking.
     */
    public void setTourId(int _tourId) {
        this._tourId = _tourId;
    }

    /**
     * Returns a string representation of the Booking object.
     *
     * @return A string containing all booking attributes.
     */
    @Override
    public String toString() {
        return "Booking{" + "_id=" + _id + ", _date=" + _date + ", _numPeople=" + _numPeople + ", _total=" + _total + ", _status=" + _status + ", _userId=" + _userId + ", _tourId=" + _tourId + '}';
    }

}
