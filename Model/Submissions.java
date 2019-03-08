public class Submissions {
    private int _id;
    private String _path;
    private Date _date;
    private boolean _has_Sent_Notice;
    private String _comment;
    private boolean _is_Selected;
    public Users _author;
    public Years _year;

    public Submissions() {
    }

    public int get_id() {
        return _id;
    }

    public void set_id(int _id) {
        this._id = _id;
    }

    public String get_path() {
        return _path;
    }

    public void set_path(String _path) {
        this._path = _path;
    }

    public Date get_date() {
        return _date;
    }

    public void set_date(Date _date) {
        this._date = _date;
    }

    public boolean is_has_Sent_Notice() {
        return _has_Sent_Notice;
    }

    public void set_has_Sent_Notice(boolean _has_Sent_Notice) {
        this._has_Sent_Notice = _has_Sent_Notice;
    }

    public String get_comment() {
        return _comment;
    }

    public void set_comment(String _comment) {
        this._comment = _comment;
    }

    public boolean is_is_Selected() {
        return _is_Selected;
    }

    public void set_is_Selected(boolean _is_Selected) {
        this._is_Selected = _is_Selected;
    }

    public Users get_author() {
        return _author;
    }

    public void set_author(Users _author) {
        this._author = _author;
    }

    public Years get_year() {
        return _year;
    }

    public void set_year(Years _year) {
        this._year = _year;
    }

    public Submissions(int _id, String _path, Date _date, boolean _has_Sent_Notice, String _comment, boolean _is_Selected, Users _author, Years _year) {
        this._id = _id;
        this._path = _path;
        this._date = _date;
        this._has_Sent_Notice = _has_Sent_Notice;
        this._comment = _comment;
        this._is_Selected = _is_Selected;
        this._author = _author;
        this._year = _year;
    }
}