using cursed.Model;
using System;
using System.Linq;

namespace cursed.ViewModel
{
    public static class UserVM
    {
        public static Core db = new Core();

        /// <summary>
        /// Проверяет  валидность логина и пароля пользователя.
        /// </summary>
        /// <param name="login">Логин пользователя.</param>
        /// <param name="password">Пароль пользователя.</param>
        /// <returns>True, если логин и пароль верны, иначе False.</returns>
        /// <exception cref="Exception">
        /// Выбрасывается, если:
        /// - Не введён логин.
        /// - Не введён пароль.
        /// - Пользователь с указанными логином и паролем не найден.
        /// </exception>
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
