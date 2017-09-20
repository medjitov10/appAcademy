require "sqlite3"
require_relative "question_follows"
require_relative "questions"
require_relative "replies"
require 'singleton'
require 'byebug'

class QuestionsDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end


class User
  attr_accessor :id, :fname, :lastname
  def self.all
    data = QuestionsDBConnection.instance.execute('SELECT * FROM users')
    data.map{|user| User.new(user)}
  end

  def self.find_by_id(id)
    var = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
       FROM
       users
       WHERE
       id = ?
    SQL
    return nil if var.length < 1
    User.new(var.first)
  end

  def self.find_by_name(fname, lastname)
    var = QuestionsDBConnection.instance.execute(<<-SQL, fname, lastname)
      SELECT
        *
       FROM
       users
       WHERE
       fname = ? AND lastname = ?
    SQL
    # debugger
    return nil if var.length < 1
    # User.new('fname' => fname, 'lastname' => lastname)
    User.new(var.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lastname = options['lastname']
  end

  def authored_questions
    # debugger
   Question.find_by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollows.followed_questions_for_user_id(@id)
  end

  def create
    raise "#{self} laredy created" if @id
    QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lastname)
      INSERT INTO
        users(fname, lastname)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} if not in DB" unless @id
    QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lastname, @id)
      UPDATE
        users
      SET
        fname = ?, lastname = ?
      WHERE
        id = ?
    SQL

  end

end
