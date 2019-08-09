defimpl String.Chars, for: Nadia.Model.Update do
  def to_string(%_{
        edited_message: %_{
          message_id: message_id,
          from: user,
          date: date,
          text: nil,
          document: nil,
          location: location,
          photo: [],
          video: nil,
          audio: nil,
          voice: nil,
          contact: nil
        }
      }) do
    "#{message_id} #{date} #{user.first_name} (#{user.id}) - #{location.latitude} #{
      location.longitude
    } http://maps.google.com/maps?q=#{location.latitude},#{location.longitude}"
  end

  def to_string(%_{
        message: %_{
          message_id: message_id,
          from: user,
          date: date,
          text: nil,
          document: nil,
          location: nil,
          photo: [],
          video: nil,
          audio: nil,
          voice: nil,
          contact: contact
        }
      }) do
    "#{message_id} #{date} #{user.first_name} (#{user.id}) - " <>
      "#{contact.first_name} #{contact.last_name} #{contact.phone_number} UserID #{
        contact.user_id
      }"
  end

  def to_string(%_{
        message: %_{
          message_id: message_id,
          from: user,
          date: date,
          text: nil,
          document: nil,
          location: nil,
          photo: [],
          video: nil,
          audio: nil,
          voice: voice,
          contact: nil
        }
      }) do
    "#{message_id} #{date} #{user.first_name} (#{user.id}) - " <>
      "#{voice.duration}s #{voice.file_id} #{voice.file_size} Bytes #{voice.mime_type}"
  end

  def to_string(%_{
        message: %_{
          message_id: message_id,
          from: user,
          date: date,
          text: nil,
          document: nil,
          location: nil,
          photo: [],
          video: nil,
          audio: audio,
          voice: nil,
          contact: nil
        }
      }) do
    "#{message_id} #{date} #{user.first_name} (#{user.id}) - " <>
      "#{audio.duration}s #{audio.file_id} #{audio.file_size} Bytes #{audio.mime_type}"
  end

  def to_string(%_{
        message: %_{
          message_id: message_id,
          from: user,
          date: date,
          text: nil,
          document: nil,
          location: nil,
          photo: [],
          video: video,
          audio: nil,
          voice: nil,
          contact: nil
        }
      }) do
    "#{message_id} #{date} #{user.first_name} (#{user.id}) - " <>
      "#{video.duration}s #{video.file_id} #{video.file_size} Bytes #{video.mime_type}"
  end

  def to_string(%_{
        message: %_{
          message_id: message_id,
          from: user,
          date: date,
          text: nil,
          document: nil,
          location: nil,
          photo: photos,
          video: nil,
          audio: nil,
          voice: nil,
          contact: nil
        }
      }) do
    photo = List.last(photos)

    "#{message_id} #{date} #{user.first_name} (#{user.id}) - imageID##{photo.file_id} #{
      photo.file_size
    } Bytes"
  end

  def to_string(%_{
        message: %_{
          message_id: message_id,
          from: user,
          date: date,
          text: nil,
          document: nil,
          location: location,
          photo: [],
          video: nil,
          audio: nil,
          voice: nil,
          contact: nil
        }
      }) do
    "#{message_id} #{date} #{user.first_name} (#{user.id}) - #{location.latitude} #{
      location.longitude
    } http://maps.google.com/maps?q=#{location.latitude},#{location.longitude}"
  end

  def to_string(%_{
        message: %_{
          message_id: message_id,
          from: user,
          date: date,
          text: nil,
          document: document,
          location: nil,
          photo: [],
          video: nil,
          audio: nil,
          voice: nil,
          contact: nil
        }
      }) do
    "#{message_id} #{date} #{user.first_name} (#{user.id}) - #{document.file_name} #{
      document.mime_type
    } #{document.file_size} Bytes #{document.file_id}"
  end
end
