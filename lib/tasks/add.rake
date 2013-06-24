# -*- encoding : utf-8 -*-
namespace :add do
  desc "Add admin user"
  task :admin => :environment do
  end

  desc "Add test data to db"
  task :test_db => :environment do
    Student.create(:lastname => "Куликов", :name => "Антон", :middlename => "Валериевич")
    Student.create(:lastname => "Ахмылов", :name => "Антон", :middlename => "Юрьевич")
    Student.create(:lastname => "Войнов", :name => "Максим", :middlename => "Александрович")
    Student.create(:lastname => "Дорофеев", :name => "Сергей", :middlename => "Иванович")
    Student.create(:lastname => "Дьяченков", :name => "Андрей", :middlename => "Александрович")
    Student.create(:lastname => "Мазов", :name => "Иван", :middlename => "Александрович")
    Student.create(:lastname => "Метейко", :name => "Татьяна", :middlename => "Николаевна")
    Student.create(:lastname => "Моцпан", :name => "Максим", :middlename => "Сергеевич")
    Student.create(:lastname => "Орленко", :name => "Николай", :middlename => "Иванович")
    Student.create(:lastname => "Сараев", :name => "Никита", :middlename => "Геннадьевич")
    Student.create(:lastname => "Шацков", :name => "Антон", :middlename => "Игоревич")
    Student.create(:lastname => "Шинаков", :name => "Александр", :middlename => "Николаевич")


    vv = RepositoryTheme.create(:name => "Введение", :path => "/intro", :count => "100")
    oi = RepositoryTheme.create(:name => "Определенные интегралы", :path => "/def_int", :count => "150")
    noi = RepositoryTheme.create(:name => "Неопределенные интегралы", :path => "/undef_int", :count => "100")
    pr = RepositoryTheme.create(:name => "Производные", :path => "/proizvod", :count => "100")
    dif = RepositoryTheme.create(:name => "Дифференциаллы", :path => "/differetials", :count => "50")
    nf = RepositoryTheme.create(:name => "Нормальные формы", :path => "/norm_forms", :count => "100")
    nr = RepositoryTheme.create(:name => "Нормальное распределение", :path => "/norm_raspred", :count => "100")
    omp = RepositoryTheme.create(:name => "OpenMP", :path => "/openmp", :count => "50")
    mpi = RepositoryTheme.create(:name => "MPI", :path => "/mpi", :count => "50")
    izm = RepositoryTheme.create(:name => "Изоморфизмы", :path => "/izomorph", :count => "50")


    vvs=Discipline.create(:name => "Введение в специальность", :repository_themes => [vv])
    pp=Discipline.create(:name => "Параллельное программирование", :repository_themes => [omp, mpi])
    pirkis=Discipline.create(:name => "Проектирование и разработка корпоративных информационных систем")
    dm=Discipline.create(:name => "Дискретная математика", :repository_themes => [vv, izm])
    kg=Discipline.create(:name => "Компьютерная графика")
    ma=Discipline.create(:name => "Математический анализ", :repository_themes => [vv, pr, dif, oi, noi])
    p=Discipline.create(:name => "Программирование")
    tvims=Discipline.create(:name => "Теория вероятностей и математическая статистика", :repository_themes => [vv, nr])
    bdisubd=Discipline.create(:name => "Базы данных и СУБД", :repository_themes => [vv, nf])
    os=Discipline.create(:name => "Операционные системы", :repository_themes => [vv])
    sippo=Discipline.create(:name => "Системное и прикладное ПО")
    pnevm=Discipline.create(:name => "Практикум на ЭВМ", :repository_themes => [vv])
    sevmit=Discipline.create(:name => "Сети ЭВМ и телекоммуникации")
    ml=Discipline.create(:name => "Математическая логика", :repository_themes => [vv])
    vt=Discipline.create(:name => "Веб-технологии")


    g1361=Group.create(:name => "1361")
    g1362=Group.create(:name => "1362")
    g2361=Group.create(:name => "2361")
    g2362=Group.create(:name => "2362")
    g4361=Group.create(:name => "4361")
    g4362=Group.create(:name => "4362")
    g6361=Group.create(:name => "6361")
    g6362=Group.create(:name => "6362")
    g8361=Group.create(:name => "8361")
    g8362=Group.create(:name => "8362")
  end

end
