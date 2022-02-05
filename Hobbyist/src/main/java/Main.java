import java.util.ArrayList;
import java.util.Scanner;

import com.message.model.AcademyDAO;
import com.message.model.AcademyDTO;

public class Main {

	public static void main(String[] args) {
		AcademyDAO dao = new AcademyDAO();
		ArrayList<AcademyDTO> list = new ArrayList<AcademyDTO>();
		Scanner sc = new Scanner(System.in);
		String a_id=sc.next();
		System.out.println(dao.A_memberSelectAll(a_id));

	}

}
