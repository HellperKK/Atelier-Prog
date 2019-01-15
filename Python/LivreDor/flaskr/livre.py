from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from flaskr.db import get_db

bp = Blueprint('blog', __name__)

@bp.route('/', methods=('GET', 'POST'))
def index():
    if request.method == 'POST':
        name = request.form['name']
        body = request.form['body']
        error = None

        # if not name:
        #     error = 'Title is required.'
        # 
        # if error is not None:
        #     flash(error)
        # else:
        db = get_db()
        db.execute(
            'INSERT INTO post (body, author_name)'
            ' VALUES (?, ?)',
            (body, name)
        )
        db.commit()
        return redirect(url_for('blog.index'))

    db = get_db()
    posts = db.execute(
        'SELECT * FROM post'
        ' ORDER BY created DESC'
    ).fetchall()
    return render_template('index.html', posts=posts)
