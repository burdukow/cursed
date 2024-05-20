using cursed.Model;
using System;
using System.Linq;

namespace cursed.ViewModel
{
    public static class UserVM
    {
        public static Core db = new Core();
        public static bool AuthCheck(string login, string password)
        {
            int checkUser = db.context.Users.Where(x => x.Login == login && x.Password == password).Count();
            if (String.IsNullOrEmpty(login))
            {
                throw new Exception("Не введён логин");
            }
            else if (String.IsNullOrEmpty(password))
            {
                throw new Exception("Не введён пароль");
            }
            else
            {
                if (checkUser == 0)
                {
                    throw new Exception("Пользователь не найден.\nПроверьте правильность связки Логин-Пароль.");
                }
                else
                {
                    return true;
                }
            }
        }
    }
}
