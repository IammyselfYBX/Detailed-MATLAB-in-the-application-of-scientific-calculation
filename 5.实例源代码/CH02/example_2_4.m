student.name={'John','Lucy'};  % 用赋值语句直接定义
student.age=22;
student.grade={3 4}
student=struct('name',{'John','Lucy'},'age',22,'grade',{3 4})  %用结构函数structure产生
student(1),student(2)  % 获取每个student的信息
student.name  % 将结构体中的name逐一显示
