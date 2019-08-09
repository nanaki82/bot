defmodule Bot.Helper do
  @moduledoc """
  deprecated! move this helpers to Parser module
  """
  def get_chat_id(%_{message: %_{from: %_{id: id}}}), do: id

  # def get_message_type(%_{message: %_{text: "/" <> _}}), do: :command
  # def get_message_type(%_{message: %_{text: message}}) when message != nil, do: :message
  # def get_message_type(%_{edited_message: %_{text: message}}) when message != nil, do: :message
  def get_message_type(%_{message: %_{document: document}}) when document != nil, do: :document
  def get_message_type(%_{message: %_{location: location}}) when location != nil, do: :location

  def get_message_type(%_{edited_message: %_{location: location}}) when location != nil,
    do: :location

  def get_message_type(%_{message: %_{photo: photo}}) when photo != [], do: :photo
  def get_message_type(%_{message: %_{viedo: video}}) when video != nil, do: :viedo
  def get_message_type(%_{message: %_{audio: audio}}) when audio != nil, do: :audio
  def get_message_type(%_{message: %_{voice: voice, photo: []}}) when voice != nil, do: :voice

  def get_message_type(%_{message: %_{contact: contact, photo: []}}) when contact != nil,
    do: :contact
end
