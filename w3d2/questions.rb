require "sqlite3"
require_relative "users"


class Question
  attr_accessor :id, :title, :body, :author_id
  def self.all
    data = QuestionsDBConnection.instance.execute('SELECT * FROM questions')
    data.map{|question| Question.new(question)}
  end
  def self.find_by_id(id)
    var = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
       FROM
       questions
       WHERE
       id = ?
    SQL
    return nil if var.length < 1
    Question.new(var.first)
  end

  def self.find_by_author_id(author_id)
    var = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil if var.length < 1
    # debugger
    var.map{|el| Question.new(el)}
  end

  def author
    User.find_by_id(self.author_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def followers
    QuestionFollows.followers_for_question_id(@id)
  end

  def create
    raise "#{self} laredy created" if @id
    QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @author_id)
      INSERT INTO
        questions(title, body, author_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} if not in DB" unless @id
    QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @author_id, @id)
      UPDATE
        questions
      SET
        title = ?, body = ?, author_id = ?
      WHERE
        id = ?
    SQL

  end
end
