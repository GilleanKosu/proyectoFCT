<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20190502103450 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE carta_partida (carta_id INT NOT NULL, partida_id INT NOT NULL, INDEX IDX_A5E5ED5A46A559E1 (carta_id), INDEX IDX_A5E5ED5AF15A1987 (partida_id), PRIMARY KEY(carta_id, partida_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE carta_partida ADD CONSTRAINT FK_A5E5ED5A46A559E1 FOREIGN KEY (carta_id) REFERENCES carta (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE carta_partida ADD CONSTRAINT FK_A5E5ED5AF15A1987 FOREIGN KEY (partida_id) REFERENCES partida (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE carta ADD usuario_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE carta ADD CONSTRAINT FK_BDB93BE4DB38439E FOREIGN KEY (usuario_id) REFERENCES user (id)');
        $this->addSql('CREATE INDEX IDX_BDB93BE4DB38439E ON carta (usuario_id)');
        // $this->addSql('ALTER TABLE partida CHANGE id id INT NOT NULL');
        $this->addSql('ALTER TABLE user CHANGE roles roles LONGTEXT NOT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP TABLE carta_partida');
        $this->addSql('ALTER TABLE carta DROP FOREIGN KEY FK_BDB93BE4DB38439E');
        $this->addSql('DROP INDEX IDX_BDB93BE4DB38439E ON carta');
        $this->addSql('ALTER TABLE carta DROP usuario_id');
        // $this->addSql('ALTER TABLE partida CHANGE id id INT AUTO_INCREMENT NOT NULL');
        $this->addSql('ALTER TABLE user CHANGE roles roles LONGTEXT NOT NULL COLLATE utf8mb4_unicode_ci');
    }
}
