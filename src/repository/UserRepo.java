package repository;

import model.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRepo implements Repository<User>
{
    @Override
    public int add(User item)
    {
        return 0;
    }

    @Override
    public User get(int id)
    {
        //language=MariaDB
        String sql = "SELECT * from User WHERE Id = ?";
        try
        {
            ResultSet resultSet = DatabaseHelper.executeQuery(sql, stm -> stm.setInt(1, id));

            if (resultSet.first())
            {
                User user = new User();
                user.set_id(id);
                user.set_role(resultSet.getString("Role"));
                user.set_faculty(new FacultyRepo().get(resultSet.getInt("Faculty_Id")));
                user.set_has_Accepted_TOC(resultSet.getBoolean("Has_Accepted_TOC"));
                user.set_email(resultSet.getString("Email"));
                
                return user;
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return null;
    }
}
