<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20190425211902 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE dado (id INT AUTO_INCREMENT NOT NULL, caras INT DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE partida (id INT AUTO_INCREMENT NOT NULL, dado_id INT DEFAULT NULL, ganador VARCHAR(255) NOT NULL, num_turnos INT DEFAULT NULL, INDEX IDX_A9C1580CB7CA418D (dado_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE partida_user (partida_id INT NOT NULL, user_id INT NOT NULL, INDEX IDX_F45797C9F15A1987 (partida_id), INDEX IDX_F45797C9A76ED395 (user_id), PRIMARY KEY(partida_id, user_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE partida ADD CONSTRAINT FK_A9C1580CB7CA418D FOREIGN KEY (dado_id) REFERENCES dado (id)');
        $this->addSql('ALTER TABLE partida_user ADD CONSTRAINT FK_F45797C9F15A1987 FOREIGN KEY (partida_id) REFERENCES partida (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE partida_user ADD CONSTRAINT FK_F45797C9A76ED395 FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE user CHANGE roles roles LONGTEXT NOT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE partida DROP FOREIGN KEY FK_A9C1580CB7CA418D');
        $this->addSql('ALTER TABLE partida_user DROP FOREIGN KEY FK_F45797C9F15A1987');
        $this->addSql('DROP TABLE dado');
        $this->addSql('DROP TABLE partida');
        $this->addSql('DROP TABLE partida_user');
        $this->addSql('ALTER TABLE user CHANGE roles roles LONGTEXT NOT NULL COLLATE utf8mb4_unicode_ci');
    }
}
