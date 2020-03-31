<?php

// Effectue la connexion à la BDD
// Instancie et renvoie l'objet PDO associé
function getBdd() {
    $bdd = new PDO('mysql:host=localhost;dbname=Blogue-vers-MVC-v1_0_0_0;charset=utf8', 'root', 'mysql', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
    return $bdd;
}

// Renvoie la liste de tous les articles, triés par identifiant décroissant
function getArticles() {
    $bdd = getBdd();
    $articles = $bdd->query('select * from Articles'
            . ' order by ID desc');
    return $articles;
}

// Renvoie la liste de tous les articles, triés par identifiant décroissant
function setArticle($article) {
    $bdd = getBdd();
    $result = $bdd->prepare('INSERT INTO articles (titre, sous_titre, utilisateur_id, date, texte, type) VALUES(?, ?, ?, NOW(), ?, ?)');
    $result->execute(array($article[titre], $article[sous_titre], $article[utilisateur_id], $article[texte], $article[type]));
    return $result;
}

// Renvoie les informations sur un article
function getArticle($idArticle) {
    $bdd = getBdd();
    $article = $bdd->prepare('select * from Articles'
            . ' where ID=?');
    $article->execute(array($idArticle));
    if ($article->rowCount() == 1)
        return $article->fetch();  // Accès à la première ligne de résultat
    else
        throw new Exception("Aucun article ne correspond à l'identifiant '$idArticle'");
}

// Renvoie la liste des commentaires associés à un article
function getCommentaires($idArticle) {
    $bdd = getBdd();
    $commentaires = $bdd->prepare('select * from Commentaires'
            . ' where article_id = ?');
    $commentaires->execute(array($idArticle));
    return $commentaires;
}

// Renvoie un commentaire spécifique
function getCommentaire($id) {
    $bdd = getBdd();
    $commentaire = $bdd->prepare('select * from Commentaires'
            . ' where id = ?');
    $commentaire->execute(array($id));
    if ($commentaire->rowCount() == 1)
        return $commentaire->fetch();  // Accès à la première ligne de résultat
    else
        throw new Exception("Aucun commentaire ne correspond à l'identifiant '$id'");
    return $commentaire;
}

// Supprime un commentaire
function deleteCommentaire($id) {
    $bdd = getBdd();
    $result = $bdd->prepare('DELETE FROM Commentaires'
            . ' WHERE id = ?');
    $result->execute(array($id));
    return $result;
}

// Ajoute un commentaire associés à un article
function setCommentaire($commentaire) {
    $bdd = getBdd();
    $result = $bdd->prepare('INSERT INTO commentaires (article_id, date, auteur, titre, texte, prive) VALUES(?, NOW(), ?, ?, ?, ?)');
    $result->execute(array($commentaire['article_id'], $commentaire['auteur'], $commentaire['titre'], $commentaire['texte'], $commentaire['prive']));
    return $result;
}

// Recherche les types répondant à l'autocomplete
function searchType($term) {
    $conn = getBdd();
    $stmt = $conn->prepare('SELECT type FROM Types WHERE type LIKE :term');
    $stmt->execute(array('term' => '%' . $term . '%'));

    while ($row = $stmt->fetch()) {
        $return_arr[] = $row['type'];
    }

    /* Toss back results as json encoded array. */
    return json_encode($return_arr);
}
