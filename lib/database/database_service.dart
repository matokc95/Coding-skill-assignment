import 'package:assignment/models/genres/data/genre.dart';
import 'package:assignment/models/movies/data/movie.dart';
import 'package:assignment/models/movies/data/movie_extended.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(databasePath, 'q_database.db');

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 2,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  // When the database is first created, create a table to store breeds
  // and a table to store dogs.
  Future<void> _onCreate(Database db, int version) async {
    // Run the CREATE {breeds} TABLE statement on the database.
    await db.execute(
      'CREATE TABLE genres(id INTEGER PRIMARY KEY, name TEXT)',
    );
    // Run the CREATE {dogs} TABLE statement on the database.
    await db.execute(
      'CREATE TABLE movies(localId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, id INTEGER, adult INTEGER, backdropPath TEXT, originalLanguage TEXT, originalTitle TEXT, overview TEXT, popularity REAL, posterPath TEXT, releaseDate TEXT, title TEXT, video INTEGER, voteAverage REAL, voteCount INTEGER, genre TEXT)',
    );
  }

  // Define a function that inserts breeds into the database
  Future<void> insertGenre(Genre genre) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Insert the Breed into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same breed is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'genres',
      genre.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertMovie(MovieExtended movieExtended) async {
    final db = await _databaseService.database;
    await db.insert(
      'movies',
      Movie.formattedMovieToJson(movieExtended),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the breeds from the breeds table.
  Future<List<Genre>> genres() async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Query the table for all the Breeds.
    final List<Map<String, dynamic>> maps = await db.query('genres');

    // Convert the List<Map<String, dynamic> into a List<Breed>.
    return List.generate(maps.length, (index) => Genre.fromJson(maps[index]));
  }

  Future<Genre> genre(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
    await db.query('genres', where: 'id = ?', whereArgs: [id]);
    return Genre.fromJson(maps[0]);
  }

  Future<List<Movie>> movies() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('movies');
    return List.generate(maps.length, (index) => Movie.fromJson(maps[index]));
  }

  // A method that updates a breed data from the breeds table.
  Future<void> updateGenre(Genre genre) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Update the given breed
    await db.update(
      'genres',
      genre.toJson(),
      // Ensure that the Breed has a matching id.
      where: 'id = ?',
      // Pass the Breed's id as a whereArg to prevent SQL injection.
      whereArgs: [genre.id],
    );
  }

  Future<void> updateMovie(Movie movie) async {
    final db = await _databaseService.database;
    await db.update('movies', movie.toJson(), where: 'id = ?', whereArgs: [movie.id]);
  }

  // A method that deletes a breed data from the breeds table.
  Future<void> deleteBreed(int id) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Remove the Breed from the database.
    await db.delete(
      'breeds',
      // Use a `where` clause to delete a specific breed.
      where: 'id = ?',
      // Pass the Breed's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> deleteDog(int id) async {
    final db = await _databaseService.database;
    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }
}