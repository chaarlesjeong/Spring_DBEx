package pack01;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import DB.OracleDB;
import model.Apple;

@Controller
public class Home {

	OracleDB db = new OracleDB();

	@RequestMapping("/create")
	public String create(@RequestBody Apple apple) {
		System.out.println(apple.getName());
		System.out.println(apple.getAge());
		db.executeUpdateQuery("INSERT INTO TABEX VALUES(" + "'" + apple.getName() + "'" + ", " + apple.getAge() + ")");
		return "CreateView";
	}

	@RequestMapping("/read")
	public String readDB(Model model) {
		ArrayList<Apple> appleArray = new ArrayList<Apple>();
		ResultSet rs = db.executeQuery("SELECT * FROM TABEX");
		System.out.println(rs);
		try {
			while (rs.next()) {
				appleArray.add(new Apple(rs.getString("name"), rs.getInt("age")));
			}
		} catch (SQLException e) {
			e.toString();
		}
		System.out.println(appleArray);
		model.addAttribute("array", appleArray);
		return "ReadView";
	}

	@RequestMapping("/update")
	public String update(@RequestBody Apple apple) {
		db.executeUpdateQuery(
				"UPDATE TABEX SET AGE = " + apple.getAge() + "WHERE NAME = " + "'" + apple.getName() + "'");
		return "UpdateView";
	}

	@RequestMapping("/delete")
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
