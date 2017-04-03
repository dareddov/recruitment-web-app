module UsersHelper
  def user_csv_headers
    [translate_attribute(User, :email),
     translate_attribute(User, :gender),
     translate_attribute(User, :age),
     translate_attribute(User, :interests)]
  end

  def user_csv_row(user)
    [user.email,
     user.gender.to_s,
     user.age,
     user.pretty_interests({all?: true, for_csv: true})]
  end
end