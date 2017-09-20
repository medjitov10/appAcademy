require "sqlite3"
require_relative "users"


class Like
  attr_accessor :id, :like_value, :question_id
  def self.all
    data = QuestionsDBConnection.instance.execute('SELECT * FROM questions_likes')
    data.map{|follow| Like.new(follow)}
  end

  def self.find_by_id(id)
    var = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
       FROM
       question_follows
       WHERE
       id = ?
    SQL
    return nil if var.length < 1
    Like.new(var.first)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @like_value = options['like_value']
  end


end
