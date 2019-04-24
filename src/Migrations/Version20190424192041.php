<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20190424192041 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE partida_casilla (partida_id INT NOT NULL, casilla_id INT NOT NULL, INDEX IDX_3AA8535AF15A1987 (partida_id), INDEX IDX_3AA8535A97DD048E (casilla_id), PRIMARY KEY(partida_id, casilla_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE partida_casilla ADD CONSTRAINT FK_3AA8535AF15A1987 FOREIGN KEY (partida_id) REFERENCES partida (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE partida_casilla ADD CONSTRAINT FK_3AA8535A97DD048E FOREIGN KEY (casilla_id) REFERENCES casilla (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE user ADD casilla_id INT DEFAULT NULL, CHANGE roles roles LONGTEXT NOT NULL');
        $this->addSql('ALTER TABLE user ADD CONSTRAINT FK_8D93D64997DD048E FOREIGN KEY (casilla_id) REFERENCES casilla (id)');
        $this->addSql('CREATE INDEX IDX_8D93D64997DD048E ON user (casilla_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP TABLE partida_casilla');
        $this->addSql('ALTER TABLE user DROP FOREIGN KEY FK_8D93D64997DD048E');
        $this->addSql('DROP INDEX IDX_8D93D64997DD048E ON user');
        $this->addSql('ALTER TABLE user DROP casilla_id, CHANGE roles roles LONGTEXT NOT NULL COLLATE utf8mb4_unicode_ci');
    }
}
