<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20190526144708 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        // $this->addSql('ALTER TABLE partida CHANGE id id INT NOT NULL');
        $this->addSql('ALTER TABLE titulo_propiedad ADD alquiler_base INT DEFAULT NULL, ADD factor_revalorizacion DOUBLE PRECISION DEFAULT NULL, ADD num_casas INT DEFAULT NULL, ADD num_hoteles INT DEFAULT NULL, ADD precio_edificar INT DEFAULT NULL');
        $this->addSql('ALTER TABLE user CHANGE roles roles LONGTEXT NOT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        // $this->addSql('ALTER TABLE partida CHANGE id id INT AUTO_INCREMENT NOT NULL');
        $this->addSql('ALTER TABLE titulo_propiedad DROP alquiler_base, DROP factor_revalorizacion, DROP num_casas, DROP num_hoteles, DROP precio_edificar');
        $this->addSql('ALTER TABLE user CHANGE roles roles LONGTEXT NOT NULL COLLATE utf8mb4_unicode_ci');
    }
}
