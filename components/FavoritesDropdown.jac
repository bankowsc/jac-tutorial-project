"""Favorites dropdown component."""

def:pub FavoritesDropdown(
    favorites: list,
    showDropdown: bool,
    onToggle: any,
    onSelectFavorite: any,
    onAddFavorite: any,
    onRemoveFavorite: any
) -> any {
    return
        <div className="favorites-dropdown">
            <button 
                className="favorites-btn"
                onClick={lambda -> None { onToggle(); }}
                aria-expanded={showDropdown}
            >
                <span className="favorites-icon">⭐</span>
                <span className="favorites-label">Favorites</span>
                <span className={("dropdown-arrow " + ("open" if showDropdown else ""))}>
                    ▼
                </span>
            </button>
            
            {(
                <div className="favorites-menu">
                    {(
                        <div className="favorites-empty">
                            <p>No favorites yet</p>
                            <p className="favorites-hint">
                                Add your favorite tasks or meals here
                            </p>
                        </div>
                    ) if favorites.length == 0 else (
                        <div className="favorites-list">
                            {[
                                <div key={fav.id} className="favorite-item">
                                    <button
                                        className="favorite-item-btn"
                                        onClick={lambda -> None { onSelectFavorite(fav); }}
                                    >
                                        <span className="favorite-emoji">
                                            {fav.emoji if hasattr(fav, "emoji") else "📌"}
                                        </span>
                                        <div className="favorite-content">
                                            <div className="favorite-title">{fav.title}</div>
                                            <div className="favorite-category">{fav.category}</div>
                                        </div>
                                    </button>
                                    <button
                                        className="favorite-remove-btn"
                                        onClick={lambda -> None { onRemoveFavorite(fav.id); }}
                                        title="Remove from favorites"
                                    >
                                        ×
                                    </button>
                                </div> for fav in favorites
                            ]}
                        </div>
                    )}
                </div>
            ) if showDropdown else None}
        </div>;
}
