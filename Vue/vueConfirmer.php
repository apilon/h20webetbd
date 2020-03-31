<?php $titre = "Supprimer - " . $commentaire['titre']; ?>
<?php ob_start(); ?>
<article>
    <header>
        <p><h1>
            Supprimer?
        </h1>
        <?= $commentaire['date'] ?>, <?= $commentaire['auteur'] ?> dit : (privé? <?= $commentaire['prive'] ?>)<br/>
        <strong><?= $commentaire['titre'] ?></strong><br/>
        <?= $commentaire['texte'] ?>
        </p>
    </header>
</article>

<form action="index.php?action=supprimer" method="post">
    <input type="hidden" name="id" value="<?= $commentaire['id'] ?>" /><br />
    <input type="submit" value="Oui" />
</form>
<form action="index.php" method="get" >
    <input type="hidden" name="action" value="article" />
    <input type="hidden" name="id" value="<?= $commentaire['article_id'] ?>" />
    <input type="submit" value="Annuler" />
</form>
<?php $contenu = ob_get_clean(); ?>

<?php require 'Vue/gabarit.php'; ?>

