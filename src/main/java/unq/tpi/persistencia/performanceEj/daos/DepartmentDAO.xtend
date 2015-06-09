package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Department
import unq.tpi.persistencia.util.SessionManager

class DepartmentDAO {

	def getByName(String name) {
		val session = SessionManager.getSession()
		session.createQuery("from Department where name = :name")
				.setParameter("name", name).uniqueResult() as Department
	}

	def getByCode(String num) {
		val session = SessionManager.getSession()
		session
		.createQuery('''
			from Department as d 
			inner join fetch d.employees as e
			inner join fetch e.salaries as s
			inner join fetch e.titles as t
			where d.number = :number and s.to = '9999-01-01'
		''')
		.setParameter("number", num)
		.uniqueResult as Department
	}

	def getAll() {
		val session = SessionManager.getSession()
		session.createCriteria(Department).list() as List<Department>
	}

}
