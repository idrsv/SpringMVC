Model - компонент, отвечающий за данные приложения и за работу с этими данными.(база данных обычно)
View- компонент, отвечающий за взаиможействие с пользователем.  View отображает данные и определяет внешний вид приложения.
Controller - компонент, отвечающий за связь между View и Controller. Именно здесь сосредоточена логика работы приложения(бизнес логика).
Spring MVC - фрейморк для создания web приложений на Джава, основе которого лежит шаблок проектирования MVC.
        Именно в нем мы можем использовать весь основной функционал Spring: IoC, Di.

        Браузер(View) ->  Front Controller -> (Model) Controller(совершает определенную работу)
        Front Controller(DispatcherServlet)
Controller - центр управления(мозг Spring MVC)
Model - контейнер для хранения данных
View - web страница, которую можно создать с помощью html, jsp, Thymeleaf и т.д.
        JSP - Java Server Page - предтавляет собой HTML код с небольшим добавлением Java
        JSTL - Java Server Pages Standard Tag Library. Это расшерение спецификации JSP.
    Spring MVC бдет состоять из:
                Конфигурация Spring;
                Описание Spring бинов;
                Web страницы;



                HIBERNATE
// Create - Insert
// Read - Select
// Update - Update
// Delete - Delete

SessionFactory- фавбрика по производству сессий. Она читает файл конфигурации и после знает как должны создаваться сессии.
Достаточно создать объект всего лишь один раз и после можно его переиспользовать.
Затем создаем саму session через sessionFactory.getCurrentSession(); - Является оберткой вокруг подключения к БД с помощью JDBC


        session.beginTransaction(); // Открыли транзакцию
        session.getTransaction().commit(); // закомитили и закрыли значит ее

@GeneratedValue - страдгия прописания генерации для первичного ключа.
                IDENTITY-автоматическое увеличения по правилам БД                           -быстро
                SEQUENCE-полагается на работу сиквенса(в MySQL его нет) созданного в БД     -быстро
                TABLE-в БД таблица со значениями                                            -медленно
                AUTO-дефолтный тип который зависит от типа БД


если мы меняем чтото с помощью сеттера то нам достаточно сделать коммит для сохранения в БД

  Update          session.createQuery("update Employee set salary = 1000 where name = 'Alexandr'" ).executeUpdate();

  Delete          Employee employee = session.get(Employee.class, 10);  session.delete(employee);
                 session.createQuery("delete Employee where name = 'Alexandr'").executeUpdate();-executeUpdate-как любой апдейт таблицы



One-to-one

UNI-когда одна сторона о них не знает
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "details_id")
    private Details details;
                                      class Parent {
                                                Child child
                                            }
                                      class Child {

                                            }

BI-когда обе знают друг о друге
                @OneToOne(cascade = CascadeType.ALL)
                @JoinColumn(name = "details_id")
                private Details details;
              и
                @OneToOne(mappedBy = "details",
                          cascade = CascadeType.ALL)
                private Employee employee;
                                      class Parent {
                                                Child child
                                            }
                                      class Child {
                                                Parent parent
                                            }

При UNI
            Employee employee = new Employee("Oleg", "Smirnov", "Sales", 200);
            Details details = new Details("Moscow", "12as123", "oleg@xyz.com");
            employee.setDetails(details);

При BI
            Employee employee = new Employee("Nikolaq", "SAdasd", "HR", 200);
            Details details = new Details("Paris", "sacas7523", "Nikolaq@xyz.com");

            employee.setDetails(details);
            details.setEmployee(employee);

______________________________
При BI
        ManyToOne
        FK ВСЕГДА в таблице Many и не забываем про mappedBy в One

                    Department department = new Department("Sales", 800,1500);
                                Employee employee1 = new Employee("Danil", "Idrisov", 800);
                                Employee employee2 = new Employee("Elena", "Smirnova", 1500);
                                Employee employee3 = new Employee("Anton", "Sidorov", 1100);
                                department.addEmployeeToDepartment(employee1);
                                department.addEmployeeToDepartment(employee2);
                                department.addEmployeeToDepartment(employee3);


                    Department department = session.get(Department.class,3);
                    System.out.println(department);
                    System.out.println(department.getEmployeeList());

                    Employee employee = session.get(Employee.class,7);
                    session.delete(employee);

При UNI
        ManyToOne   Dep-source/Emp-target.
        в аннотации JoinColumn name будет ссылаться на FK не из source а из target.

Типы загрузки данных:
  EAGER-нетерпеливая-при ее использовании связанные сущности загружаются сразу вместе с загрузкой основной сущности
  делает один селект всего чтобы не делать селект еще раз
  LAZY-ленивая-при ее использовании связанные сущности не загружаются сразу вместе с загрузкой основной сущности.
                Связанные сущности загрузятся только при первом обращении к ним.

  OneToOne - Eager
  OneToMany - Lazy
  ManyToOne - Eager
  ManyToMany - Lazy

  Сработает в обоих случаях.
              System.out.println("Get department");
              Department department = session.get(Department.class,8);
              System.out.println("Show department");
              System.out.println(department);
              System.out.println("Show employees of the department");
              System.out.println(department.getEmployeeList());

              Сработает только если EAGER!!!! а с LAZY нет
                            System.out.println("Get department");
                            Department department = session.get(Department.class,8);
                            System.out.println("Show department");
                            System.out.println(department);
                                         session.getTransaction().commit();
                            System.out.println("Show employees of the department");
                            System.out.println(department.getEmployeeList());


              Решается с помощью подгрузкой заранее
                                        System.out.println("Get department");
                                        Department department = session.get(Department.class,8);
                                        System.out.println("Show department");
                                        System.out.println(department);
                                        System.out.println("Получаем наших работников");
                                                         department.getEmployeeList().get(0);
                                        session.getTransaction().commit();
                                        System.out.println("Show employees of the department");
                                        System.out.println(department.getEmployeeList());


  JoinTable-таблица которая отображает связь между строками 2-х других таблиц.
  Столбцы JoinTable это FK которые ссылаются на PK связываемых таблиц.

      @ManyToMany(cascade = CascadeType.ALL)
      @JoinTable(
              name = "child_section", ---название таблицы котора выполняет роль Join Table
              joinColumns = @JoinColumn (name = "child_id"), --- столбец таблицы Join Table который ссылается на PK source таблицы
              inverseJoinColumns = @JoinColumn (name = "section_id") --- столбец таблицы Join Table который ссылается на PK target таблицы
      )

save and Persist оба сохраняют но делают это по разному так как разные пакеты hibernate и javax.persistance
            при CascadeType.ALL - save
            при {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH} - persist

