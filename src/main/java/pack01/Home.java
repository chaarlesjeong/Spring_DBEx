package pack01;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import DB.OracleDB;
import model.User;

@RestController // Controller에서 view 반환하게 함
public class Home {

	OracleDB db = new OracleDB();

	@RequestMapping("/CreateView")
	public String create(@RequestBody User user) {
		System.out.println(user.getName());
		System.out.println(user.getAge());
		db.executeUpdateQuery("INSERT INTO TABEX VALUES(" + "'" + user.getName() + "'" + ", " + user.getAge() + ")");
		return "";
	}

	@ResponseBody
	@RequestMapping("/read")
	public ArrayList<User> read(Model model) {
		ResultSet rs = db.executeQuery("SELECT * FROM TABEX");
		ArrayList<User> users = new ArrayList<User>();
		System.out.println(rs);
		try {
			while (rs.next()) {
				users.add(new User(rs.getString("name"), rs.getInt("age")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(users);
		model.addAttribute("array", users);
		return users;
	}

	@RequestMapping("/UpdateView")
	public String update(@RequestBody User user) {
		db.executeUpdateQuery("UPDATE TABEX SET AGE = " + user.getAge() + "WHERE NAME = " + "'" + user.getName() + "'");
		return "";
	}

	@RequestMapping("/DeleteView")
	public String delete(@RequestBody String name) {
		System.out.println(name);
		String temp = name.replaceAll("=", "");
		System.out.println(temp);
		db.executeUpdateQuery("DELETE FROM TABEX WHERE NAME = " + "'" + temp + "'");
		return "";
	}

//	Close DB
	public void close() {
		db.close();
	}
}
