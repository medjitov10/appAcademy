require "sqlite3"
require_relative "users"


class Reply
  attr_accessor :id, :question_id, :body, :reply_id, :user_id
  def self.all
    data = QuestionsDBConnection.instance.execute('SELECT * FROM replies')
    data.map{|follow| Reply.new(follow)}
  end

  def self.find_by_id(id)
    var = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
       FROM
       replies
       WHERE
       id = ?
    SQL
    return nil if var.length < 1
    Reply.new(var.first)
  end

  def self.find_by_user_id(user_id)
    var = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    # debugger
    return nil if var.length == 0
    var.map do |el|
      Reply.new(el)
    end
  end

  def self.find_by_question_id(question_id)
    var = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    # debugger
    return nil if var.length == 0

    var.map do |el|
      Reply.new(el)
    end
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @body = options['body']
    @reply_id = options['reply_id']
    @user_id = options['user_id']
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@reply_id)
  end

  def child_replies
    var = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        reply_id = ?
    SQL
    return nil if var.empty?
    Reply.new(var.first)
  end
end
