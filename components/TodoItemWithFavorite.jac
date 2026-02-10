"""Enhanced Todo item component with favorites support."""

def:pub TodoItemWithFavorite(
    todo: dict,
    onToggle: any,
    onDelete: any,
    onToggleFavorite: any,
    isFavorite: bool
) -> any {
    return
        <div className="todo-item">
            <input
                type="checkbox"
                checked={todo.completed}
                onChange={lambda -> None { onToggle(todo.id); }}
                className="todo-checkbox"
            />
            <span className={("todo-title-completed" if todo.completed else "todo-title")}>
                {todo.title}
            </span>
            {(
                <span className="category-badge">{todo.category}</span>
            ) if todo.category and todo.category != "other" else None}
            
            <button
                onClick={lambda -> None { onToggleFavorite(todo.id); }}
                className={("todo-favorite-btn " + ("favorited" if isFavorite else ""))}
                title={("Remove from favorites" if isFavorite else "Add to favorites")}
            >
                {("⭐" if isFavorite else "☆")}
            </button>
            
            <button
                onClick={lambda -> None { onDelete(todo.id); }}
                className="todo-delete-btn"
            >
                ×
            </button>
        </div>;
}
