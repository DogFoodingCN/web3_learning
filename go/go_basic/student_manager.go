package main

import "fmt"

type Student struct {
	Name  string
	Age   int
	Score int
}

type StudentManager struct {
	students []Student
	history  []string
}

func NewStudentManager() *StudentManager {
	return &StudentManager{
		students: make([]Student, 0),
		history:  make([]string, 0),
	}
}

func (s *StudentManager) AddStudent(student Student) {
	s.students = append(s.students, student)
	s.history = append(s.history, fmt.Sprintf("Added student: %s", student.Name))
}

func (s *StudentManager) RemoveStudent(name string) {
	s.students = removeStudent(s.students, name)
}

func removeStudent(student []Student, name string) []Student {
	for i, s := range student {
		if s.Name == name {
			return append(student[:i], student[i+1:]...)
		}
	}
	return student
}

func (s *StudentManager) GetStudent(name string) Student {
	for _, student := range s.students {
		if student.Name == name {
			return student
		}
	}
	return Student{}
}

func (s *StudentManager) GetAllStudents() []Student {
	return s.students
}

func (s *StudentManager) GetHistory() []string {
	return s.history
}

func (s *StudentManager) ClearHistory() {
	s.history = s.history[:0]
}

func (s *StudentManager) GetStudentCount() int {
	return len(s.students)
}

func (s *StudentManager) GetStudentHistory() []string {
	return s.history
}

func main() {
	studentManager := NewStudentManager()
	studentManager.AddStudent(Student{Name: "Alice", Age: 20, Score: 90})
	studentManager.AddStudent(Student{Name: "Bob", Age: 21, Score: 85})
	studentManager.AddStudent(Student{Name: "Charlie", Age: 22, Score: 95})
	fmt.Println(studentManager.GetStudent("Alice"))
	fmt.Println(studentManager.GetAllStudents())
	fmt.Println(studentManager.GetHistory())
	fmt.Println(studentManager.GetStudentCount())
	fmt.Println(studentManager.GetStudentHistory())

	studentManager.RemoveStudent("Bob")
	fmt.Println(studentManager.GetStudent("Bob"))
	fmt.Println(studentManager.GetAllStudents())
	fmt.Println(studentManager.GetHistory())
	fmt.Println(studentManager.GetStudentCount())
	fmt.Println(studentManager.GetStudentHistory())

	studentManager.ClearHistory()
	fmt.Println(studentManager.GetHistory())
	fmt.Println(studentManager.GetStudentCount())
}
