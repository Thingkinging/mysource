package doit09;

import java.util.Comparator;
import java.util.Scanner;

class AnyLinkedListTester {
	static Scanner scanner = new Scanner(System.in);
	
	static class Data{
		static final int NO = -1;
		static final int NAME = -2;
		
		private Integer no;
		private String name;
		
		public String toString() {
			return "("+no+")" + name;
		}
		
		void scanData(String guide, int sw) {
			System.out.println(guide + "�� �����͸� �Է��ϼ���.");
			
			if ((sw & NO) == NO) {
				System.out.print("��ȣ : ");
				no = scanner.nextInt();
			}
			if ((sw & NAME) == NAME) {
				System.out.print("�̸� : ");
				name = scanner.next();
			}
		}
		
		public static final Comparator<Data> NO_ORDER = new NoOrderComparator();
		
		private static class NoOrderComparator implements Comparator<Data>{
			public int compare(Data d1, Data d2) {
				return (d1.no > d2.no) ? 1 : (d1.no < d2.no) ? -1 : 0;
			}
		}
		
		public static final Comparator<Data> NAME_ORDER = new NameOrdereComparator();
		
		private static class NameOrdereComparator implements Comparator<Data>{
			public int compare(Data d1, Data d2) {
				return d1.name.compareTo(d2.name);
			}
		}
	}
	
	enum Menu{
		ADD_FITST(	"�Ӹ��� ��带 ����"),
		ADD_LAST(	"�������� ��带 ����"),
		RMV_FITST(	"�Ӹ� ��带 ����"),
		RMV_LAST(	"���� ��带 ����"),
		RMV_CRNT(	"���� ��带 ����"),
		CLREAR(		"��� ��带 ����"),
		SERCH_NO(	"��ȣ�� �˻�"),
		SERCH_NAME(	"�̸����� �˻�"),
		NEXT(		"���� ��带 �ϳ� �������� �̵�"),
		PRINT_CRNT(	"���� ��带 ���"),
		DUMP(		"��� ��带 ���"),
		TERMINATE(	"����");
		
		private final String message;
		
		static Menu MenuAt(int idx) {
			for (Menu m : Menu.values()) {
				if (m.ordinal() == idx) {
					return m;
				}
			}
			return null;
		}
		Menu(String string){
			message = string;
		}
		String getMessage() {
			return message;
		}
	}
	
	static Menu SelectMenu() {
		int key;
		do {
			for (Menu m : Menu.values()) {
				System.out.printf("(%d) %s ", m.ordinal(), m.getMessage());
				if ((m.ordinal() % 3) == 2 && m.ordinal() != Menu.TERMINATE.ordinal()) {
					System.out.println();
				}
			}
			System.out.print(" : ");
			key = scanner.nextInt();
		} while (key < Menu.ADD_FITST.ordinal() || key > Menu.TERMINATE.ordinal());
		
		return Menu.MenuAt(key);
	}
	
	public static void main(String[] args) {
		Menu menu;
		Data data;
		Data ptr;
		Data temp = new Data();
		
		AryLinkedList<Data> list = new AryLinkedList<Data>(100);
		
		do {
			switch (menu = SelectMenu()) {
			case ADD_FITST:
				data = new Data();
				data.scanData("�Ӹ��� ����", Data.NO | Data.NAME);
				list.addFisrt(data);
				break;

			case ADD_LAST:
				data = new Data();
				data.scanData("������ ����", Data.NO | Data.NAME);
				list.addLast(data);
				break;
				
			case RMV_FITST:
				list.removeFirst();
				break;
				
			case RMV_LAST:
				list.removeLast();
				break;
				
			case RMV_CRNT:
				list.removeCurrentNode();
				break;
				
			case SERCH_NO:
				temp.scanData("�˻�", Data.NO);
				ptr = list.seach(temp, Data.NO_ORDER);
				if (ptr == null) {
					System.out.println("�� ��ȣ�� �����Ͱ� �����ϴ�");
				} else {
					System.out.println("�˻� ���� : " +ptr);
				}
				break;
				
			case SERCH_NAME:
				temp.scanData("�˻�", Data.NAME);
				ptr = list.seach(temp, Data.NAME_ORDER);
				if (ptr == null) {
					System.out.println("�� �̸��� �����Ͱ� �����ϴ�");
				} else {
					System.out.println("�˻� ���� : " +ptr);
				}
				break;
				
			case NEXT:
				list.next();
				break;
				
			case PRINT_CRNT:
				list.printCurrentNode();
				break;
				
			case DUMP:
				list.dump();;
				break;
				
			case CLREAR:
				list.clear();
				break;
				
			}
		} while (menu != Menu.TERMINATE);
	}
	
}
