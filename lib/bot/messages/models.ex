defmodule User do
  defstruct [:id, :first_name, :last_name, :username]

  @type t :: %User{
          id: integer,
          first_name: String.t(),
          last_name: String.t(),
          username: String.t()
        }
end

defimpl String.Chars, for: User do
  @spec to_string(User.t()) :: String.t()
  def to_string(%User{id: id, first_name: name, last_name: surname, username: nickname}) do
    cond do
      name && surname && nickname -> "##{id} #{name} #{surname} (#{nickname})"
      name && surname -> "##{id} #{name} #{surname}"
      name && nickname -> "##{id} #{name} (#{nickname})"
      name -> name
    end
  end
end
