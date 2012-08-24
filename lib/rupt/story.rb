module Rupt
  class Story < SimpleDelegator
    def summary
      type  = Colorizer.type(story_type.rjust(9))
      est   = "#{estimate}".ljust(3).yellow
      state = Colorizer.state(current_state.ljust(12))
      owner = (owned_by ? "(#{owned_by})" : '').yellow
      [type, id, est, state, name, owner].join(' ')
    end

    def assign_to(author_name)
      update owned_by: author_name
    end

    def start
      update current_state: 'In progress'
    end

    def finish
      update current_state: 'Finished'
    end

    def deliver
      update current_state: 'Delivered'
    end

    def accept
      update current_state: 'Accepted'
    end

    def reject
      update current_state: 'Rejected'
    end

    def add_note(msg)
      notes.create text: msg
    end

    def remove_task(id)
      tasks.find(id).delete
    end

    def complete_task(id)
      tasks.find(id).update complete: true
    end

    def uncomplete_task(id)
      tasks.find(id).update complete: false
    end

    def note_summaries
      max_author_length = notes.all.map(&:author).map(&:size).max
      notes.all.map do |note|
        "#{note.author.ljust(max_author_length).green} - #{note.noted_at.strftime('%d-%m-%Y %H:%M').yellow} - #{note.text}"
      end
    end

    def branch_name
      "#{story_type}_#{id}"
    end

    def add_task(msg)
      tasks.create description: msg
    end

    def task_list
      tasks.all.map do |task|
        "#{task.complete ? '+' : '-'} #{task.id} #{task.description}".send(task.complete ? :green : :red)
      end
    end

    def to_list
      Pivot::ListFormatter.new({
        'ID'           => id,
        'Name'         => name,
        'Description'  => description,
        'Type'         => story_type,
        'Created at'   => created_at,
        'State'        => current_state,
        'Estimate'     => estimate,
        'Requested by' => requested_by,
        'Owned by'     => owned_by,
        'Labels'       => labels
      })
    end
  end
end
