package model;

/**
 * This class is used to store data/attributes corresponding to tables in the
 * database.
 *
 * @author ThinhNPCE170008
 */
public class Tour {

    // Attributes of the Tour class
    private int _id;
    private String _name;
    private String _descrip;
    private double price;
    private String _destina;
    private String intro;
    private String url_video;
    private String intr_place;
    private String p1;
    private String p2;

    /**
     * Default constructor initializes attributes with default values.
     */
    public Tour() {
        this._id = -1;
        this._name = "";
        this._descrip = "";
        this.price = 0.0;
        this._destina = "";
        this.intro = "";
        this.url_video = "";
    }

    public Tour(int _id, String _name, String _descrip, double price, String _destina, String intro, String url_video, String intr_place, String p1, String p2) {
        this._id = _id;
        this._name = _name;
        this._descrip = _descrip;
        this.price = price;
        this._destina = _destina;
        this.intro = intro;
        this.url_video = url_video;
        this.intr_place = intr_place;
        this.p1 = p1;
        this.p2 = p2;
    }






    
    /**
     * Gets the tour ID.
     *
     * @return The unique identifier of the tour.
     */
    public int getId() {
        return _id;
    }

    /**
     * Sets the tour ID.
     *
     * @param _id The unique identifier to be assigned to the tour.
     */
    public void setId(int _id) {
        this._id = _id;
    }

    /**
     * Gets the name of the tour.
     *
     * @return The name of the tour.
     */
    public String getName() {
        return _name;
    }

    /**
     * Sets the name of the tour.
     *
     * @param _name The name to be assigned to the tour.
     */
    public void setName(String _name) {
        this._name = _name;
    }

    /**
     * Gets the description of the tour.
     *
     * @return The description of the tour.
     */
    public String getDescrip() {
        return _descrip;
    }

    /**
     * Sets the description of the tour.
     *
     * @param _descrip The description to be assigned to the tour.
     */
    public void setDescrip(String _descrip) {
        this._descrip = _descrip;
    }

    /**
     * Gets the price of the tour.
     *
     * @return The price of the tour.
     */
    public double getPrice() {
        return price;
    }

    /**
     * Sets the price of the tour.
     *
     * @param price The price to be assigned to the tour.
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * Gets the destination of the tour.
     *
     * @return The destination of the tour.
     */
    public String getDestina() {
        return _destina;
    }

    /**
     * Sets the destination of the tour.
     *
     * @param _destina The destination to be assigned to the tour.
     */
    public void setDestina(String _destina) {
        this._destina = _destina;
    }


    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getUrl_video() {
        return url_video;
    }

    public void setUrl_video(String url_video) {
        this.url_video = url_video;
    }

    public String getIntr_place() {
        return intr_place;
    }

    public void setIntr_place(String intr_place) {
        this.intr_place = intr_place;
    }

    public String getP1() {
        return p1;
    }

    public void setP1(String p1) {
        this.p1 = p1;
    }

    public String getP2() {
        return p2;
    }

    public void setP2(String p2) {
        this.p2 = p2;
    }

    /**
     * Returns a string representation of the Tour object.
     *
     * @return A string containing all tour attributes.
     */
    @Override
    public String toString() {
        return "Tour{" + "_id=" + _id + ", _name=" + _name + ", _descrip=" + _descrip + ", price=" + price + ", _destina=" + _destina  + '}';
    }

}
