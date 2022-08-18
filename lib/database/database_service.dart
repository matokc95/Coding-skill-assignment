import 'package:assignment/models/genres/data/genre.dart';
import 'package:assignment/models/movies/data/movie.dart';
import 'package:assignment/models/movies/data/movie_dao.dart';
import 'package:assignment/models/movies/data/movie_extended.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'q_database.db');

    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 4,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE genres(id INTEGER PRIMARY KEY, name TEXT)',
    );
    await db.execute(
      'CREATE TABLE movies(localId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, id INTEGER, adult INTEGER, backdropPath TEXT, originalLanguage TEXT, originalTitle TEXT, overview TEXT, popularity REAL, posterPath TEXT, releaseDate TEXT, title TEXT, video INTEGER, voteAverage REAL, voteCount INTEGER, genre TEXT, favourite INTEGER)',
    );
  }

  Future<void> insertGenre(Genre genre) async {
    final db = await _databaseService.database;

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
      Movie.formattedMovieDaoToJson(movieExtended),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Genre>> genres() async {
    final db = await _databaseService.database;

    final List<Map<String, dynamic>> maps = await db.query('genres');

    return List.generate(maps.length, (index) => Genre.fromJson(maps[index]));
  }

  Future<Genre> genre(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
    await db.query('genres', where: 'id = ?', whereArgs: [id]);
    return Genre.fromJson(maps[0]);
  }

  Future<List<MovieDao>> movies() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('movies');
    return List.generate(maps.length, (index) => MovieDao.fromJson(maps[index]));
  }


  Future<void> updateGenre(Genre genre) async {

    final db = await _databaseService.database;


    await db.update(
      'genres',
      genre.toJson(),
      where: 'id = ?',
      whereArgs: [genre.id],
    );
  }

  Future<void> deleteFavouriteMovie(int id) async {
    final db = await _databaseService.database;
    await db.delete('favourites', where: 'id = ?', whereArgs: [id]);
  }

  Future<MovieDao?> selectMovieById(int id) async {
    MovieDao? movie;
    try {
      final db = await _databaseService.database;
      final List<Map<String, dynamic>> maps =
          await db.query('movies', where: 'id = ?', whereArgs: [id]);
      movie = MovieDao.fromJson(maps[0]);
    } catch (e) {
      print(e);
    }
    return movie;
  }

  Future<List<MovieDao>> selectFavourites() async {
    List<MovieDao> favourites = [];
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> data =  await db.rawQuery('SELECT * FROM movies WHERE favourite = 1');
    for(Map<String, dynamic> element in data){
      MovieDao movieDao = MovieDao.fromJson(element);
      favourites.add(movieDao);
    }

    print("Fetched favourites!");

    return favourites;
  }

  Future<void> updateMovie(MovieDao movieDao) async {
    final db = await _databaseService.database;
    await db.update('movies', movieDao.toJson(), where: 'id = ?', whereArgs: [movieDao.id]);
  }
}