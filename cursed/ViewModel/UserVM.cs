using cursed.model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cursed.ViewModel
{
    public class UserVM
    {
        Core db = new Core();
        public bool AuthCheck(string login, string password)
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
